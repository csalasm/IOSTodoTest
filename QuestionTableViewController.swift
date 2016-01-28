//
//  QuestionTableViewController.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 23/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {
    
    // MARK: Properties
    //var question: Question?
    var test: Test?
    var prueba = "Probando"
    var currentQuestion = 0
    var userAnswers: [Answer] = [Answer]()
    
    // MARK: Management variables
    var selectedRow: Int = 0
    var appDelegate: AppDelegate?
        
    
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        questionImage.hidden = true
        nextButton.enabled = false
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        test = appDelegate?.currentTest
        loadQuestion()
    }
    
    func loadQuestion() {
        // Titulo de la pregunta
        questionText.text = test!.arrayQuestions![0].text
        let imageB64 = test?.arrayQuestions![0].image
        if imageB64 != nil {
            let imageData = NSData(base64EncodedString: imageB64!, options: .IgnoreUnknownCharacters)
            let image = UIImage(data: imageData!)
            questionImage.image = image
            questionImage.hidden = false
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (test?.arrayQuestions![currentQuestion].arrayAnswers?.count)!

    }
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "QuestionTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! QuestionTableViewCell
        let answer = test?.arrayQuestions![currentQuestion].arrayAnswers?[indexPath.row]
        cell.answerText.text = answer?.text
        // Configure the cell...

        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nextButton.enabled = true
        selectedRow = (tableView.indexPathForSelectedRow?.row)!
        let response = test?.arrayQuestions![currentQuestion].arrayAnswers![selectedRow]
        userAnswers.insert(response!, atIndex: currentQuestion)
        resetChecks()
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .Checkmark {
                cell.accessoryType = .None
            } else {
                cell.accessoryType = .Checkmark
            }
            
        }
        
    }
    
    
    func resetChecks()
    {
        for i in 0...tableView.numberOfSections-1
        {
            for j in 0...tableView.numberOfRowsInSection(i)-1
            {
                if let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: j, inSection: i)) {
                    cell.accessoryType = .None
                }
                
            }
        }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Action
    
    @IBAction func nextQuestion(sender: UIBarButtonItem) {
        currentQuestion++
        if currentQuestion < test?.arrayQuestions?.count {
            nextButton.enabled = false
            questionText.text = test?.arrayQuestions![currentQuestion].text
            let imageB64 = test?.arrayQuestions![currentQuestion].image
            if imageB64 != nil {
                let imageData = NSData(base64EncodedString: imageB64!, options: .IgnoreUnknownCharacters)
                let image = UIImage(data: imageData!)
                questionImage.image = image
                questionImage.hidden = false
            }
            else {
                questionImage.hidden = true
            }
            
        }
        else {
            correctTest()
            return;
        }
        if currentQuestion == (test?.arrayQuestions?.count)!-1 {
            nextButton.title = "Finalizar"
        }

        tableView.reloadData()
        //print(selectedRow)
        resetChecks()
    }
    
    // MARK: Manage Test
    func correctTest() {
        var correct = 0
        var fail = 0
        
        // Si ha seleccionado preguntas
        if userAnswers.count > 0 {
            var i = 0
            for question in (test?.arrayQuestions)! {
                var correctAnswer: Answer?
                // Buscamos cual era la respuesta correcta
                for answer in (question.arrayAnswers)! {
                    if answer.isCorrect {
                        correctAnswer = answer
                    }
                    
                }
                // Comprobamos si acertó o falló
                if correctAnswer!.id == userAnswers[i].id {
                    correct++
                } else {
                    fail++
                }
                i++
                
            }
        }
        calcMark(correct, fail: fail, numQuestions: (test?.arrayQuestions?.count)!)
    }
    
    func calcMark(correct: Int, fail:Int, numQuestions: Int) {
        print(correct)
        print(fail)
        var mark = 0.0
        let answerMark = 10.0 / Double(numQuestions)
        
        if test?.resta == "0" {
            mark = answerMark * Double(correct)
        } else {
            if (test?.resta)! == "1" {
                mark = (answerMark * Double(correct)) - (answerMark * Double(fail));
            } else {
                mark = (answerMark * Double(correct)) - (answerMark * Double(fail) / Double((test?.resta)!)!)
            }
        }
        
        mark = round(mark*100.0)/100.0;
        if mark < 0 {
            mark = 0
        }
        
        // Guardar resultados
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let fecha = dateFormatter.stringFromDate(NSDate())
        let examen = Examen(dni: (appDelegate?.usuario!.dni)!,
            id: String(test!.idTest), aciertos: correct, fallos: fail, nota: mark, fecha: fecha, nombre: "")
        let examenActions = ExamenActions()
        examenActions.saveExamen(examen) { () -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                    self.showSimpleAlert(mark) //muestra la nota por alerta
            })
        }
        
        
    }
    
    func showSimpleAlert(nota : Double) {
        let title = NSLocalizedString("Su calificación es de: ", comment: "")
        
        let message = NSLocalizedString( String(nota) , comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the action.
        let loadingAlert = LoadingAlert(point: self.view.center)
        
        let okAction = UIAlertAction(title: cancelButtonTitle, style: .Default) { action in
            loadingAlert.show()
            let testAction = TestActions()
            testAction.testAuth((self.appDelegate?.usuario?.dni)!) { (arrayTest: [Test]) -> Void in
                dispatch_async(dispatch_get_main_queue(), {
                    self.appDelegate!.arrayTest = arrayTest
                    
                    loadingAlert.hide()
                    // Despues de cargar los tests, cambiamos de ventana
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vcTest = storyboard.instantiateViewControllerWithIdentifier("TestList")
                    self.presentViewController(vcTest, animated: true, completion: nil)
                    
                })
            }
        }
        // Add the action.
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}
