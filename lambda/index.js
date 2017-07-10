var aws_reserved_instance_checker = require('aws_reserved_instance_checker');

exports.handler = function (event, context, callback) {
    try {

        aws_reserved_instance_checker();

        context.succeed()
    }
    catch (err) {
        context.fail(JSON.stringify(err));
    }
};