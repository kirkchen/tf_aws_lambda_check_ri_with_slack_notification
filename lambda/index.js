var aws_reserved_instance_checker = require('aws_reserved_instance_checker').default;

exports.handler = function (event, context, callback) {
    try {

        aws_reserved_instance_checker()
            .then(
                function () {
                    context.succeed()
                },
                function (err) {
                    context.fail(err);
                });
    }
    catch (err) {
        context.fail(err);
    }
};