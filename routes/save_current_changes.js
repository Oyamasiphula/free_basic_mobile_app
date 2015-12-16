exports.getSavedInfoPg1 = function(req,res,next){
	req.getConnection(function(err,connection){
		connection.query('select * from applicants WHERE applicants.applicant_id LIKE ?',function(err,result){
			res.render('questions1'){
				results:results
			};
		});
	});
};
exports.getSavedInfoPg2 = function(req,res,next){
	req.getConnection(function(err,connection){
		connection.query('select * from applicants WHERE applicants.applicant_id LIKE ?',function(err,result){
			res.render('question2'){
				results:results
			};
		});
	});
};

exports.addInfo_1stQuestion = function (req, res, next) {
    req.getConnection(function(err, connection){
        
        var input = JSON.parse(JSON.stringify(req.body));

		var data = {
            multipleChoice : input.multipleChoice,
            experiance : input.experiance
      };
        connection.query('insert into applicants set ?', data, function(err, results) {
            if (err){
                    return next(err);
            }
            res.redirect('/applicant_info');
        });
    });
};

exports.getInfo = function(req, res, next){
        var id = req.params.id;
    req.getConnection(function(err, connection){

        connection.query('SELECT * FROM applicants WHERE id = ?', [id], function(err,rows){
            if(err){
                        return next(err);
            }

            res.render('editapplicant_info',{page_title:"Edit Customers - Node.js", data : rows[0]});      
        }); 
    });
};

exports.updateInfo = function(req, res, next){

        var data = JSON.parse(JSON.stringify(req.body));
        var id = req.params.id;
    req.getConnection(function(err, connection){
        connection.query('UPDATE applicants SET ? WHERE id = ?', [data, id], function(err, rows){
            
            if (err){
              return next(err);
            }
            res.redirect('/applicant_info');
        });
    });
};