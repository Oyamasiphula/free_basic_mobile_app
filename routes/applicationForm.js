exports.showQuest1 = function(req,res,next){
	req.getConnection(function(err,connection){
		var id = req.params.id;

    	connection.query('SELECT background_option_id, coded_before from coded_before_options', [], function(err, optionsList) {
        	if (err)
              		return next("Error Selecting : %s ",err );
        connection.query('SELECT * FROM applicants_td',function(err,results){
    		if (err)
              		return next("Error Selecting : %s ",err );

					var experiance = results[0];
					console.log(experiance)

					var options = optionsList.map(function(option){
						return {
							background_option_id : option.background_option_id,
							coded_before : option.coded_before,
							//selected : option.background_option_id === experiance.background_option_id
						}
					});

					// console.log(options)
				res.render('question1',{
			 	optionsList:optionsList,
				experiances:experiance
				})
			});
		});
	});
};

exports.addApplicantInfoQ1 = function (req, res, next) {
    req.getConnection(function(err, connection){
        
        var input = JSON.parse(JSON.stringify(req.body));

		var data = {
            background_option_id : input.background_option_id,
            experiance : input.experiance
      };
        connection.query('insert into applicants_td set ?', data, function(err, results) {
            if (err){
                    return next(err);
            }
            res.redirect('/applicantDetails');
        });
    });
};

exports.editApplicantInfoQ2 = function (req, res, next) {
    req.getConnection(function(err, connection){
        
        var input = JSON.parse(JSON.stringify(req.body));

		var data = {
            background_option_id : input.background_option_id,
            experiance : input.experiance
      };
        connection.query('insert into applicants_td set ?', data, function(err, results) {
            if (err){
                    return next(err);
            }
            res.redirect('/applicant_info');
        });
    });
};

// exports.getInfo = function(req, res, next){
//         var id = req.params.id;
//     req.getConnection(function(err, connection){

//         connection.query('SELECT * FROM applicants WHERE id = ?', [id], function(err,rows){
//             if(err){
//                         return next(err);
//             }

//             res.render('editapplicant_info',{page_title:"Edit Customers - Node.js", data : rows[0]});      
//         }); 
//     });
// };

// exports.updateInfo = function(req, res, next){

//         var data = JSON.parse(JSON.stringify(req.body));
//         var id = req.params.id;
//     req.getConnection(function(err, connection){
//         connection.query('UPDATE applicants SET ? WHERE id = ?', [data, id], function(err, rows){
            
//             if (err){
//               return next(err);
//             }
//             res.redirect('/applicant_info');
//         });
//     });
// };// exports.getSavedInfoPg2 = function(req,res,next){
// 	req.getConnection(function(err,connection){
// 		connection.query('select * from applicants WHERE applicants.applicant_id LIKE ?',function(err,result){
			
// 			res.render('question2',{
// 				results:results
// 			})
// 		});
// 	});
// };

// exports.addInfo_1stQuestion = function (req, res, next) {
//     req.getConnection(function(err, connection){
        
//         var input = JSON.parse(JSON.stringify(req.body));

// 		var data = {
//             multipleChoice : input.multipleChoice,
//             experiance : input.experiance
//       };
//         connection.query('insert into applicants set ?', data, function(err, results) {
//             if (err){
//                     return next(err);
//             }
//             res.redirect('/applicant_info');
//         });
//     });
// };

// exports.getInfo = function(req, res, next){
//         var id = req.params.id;
//     req.getConnection(function(err, connection){

//         connection.query('SELECT * FROM applicants WHERE id = ?', [id], function(err,rows){
//             if(err){
//                         return next(err);
//             }

//             res.render('editapplicant_info',{page_title:"Edit Customers - Node.js", data : rows[0]});      
//         }); 
//     });
// };

// exports.updateInfo = function(req, res, next){

//         var data = JSON.parse(JSON.stringify(req.body));
//         var id = req.params.id;
//     req.getConnection(function(err, connection){
//         connection.query('UPDATE applicants SET ? WHERE id = ?', [data, id], function(err, rows){
            
//             if (err){
//               return next(err);
//             }
//             res.redirect('/applicant_info');
//         });
//     });
// };