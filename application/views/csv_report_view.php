<?php
if (!function_exists('echoQuestionData'))
{
    function formatAverage($avg)
    {
        return number_format((float)$avg, 2, '.', '');
    }

    function echoQuestionData($q)
    {
        ?>
        <?php echo $q['description'] . "\r\n"; ?>
        <?php echo ',N/A,1,2,3,4,5,Average' . "\r\n"?>
        <?php
        echo ',';
        for($i = 1; $i <= 5; $i++)
            echo $q['answers'][$i] . ',';

        echo formatAverage($q['average']) . "\r\n";
        ?>

        <?php
        foreach($q['comments'] as $comment)
            echo ',' . $comment . "\r\n";
        ?>
    <?php
    }

    function renderQuestionSection($questions)
    {
        if (count($questions) == 0)
        {
            echo 'No such data.' . "\r\n";
        }
        else
        {
            foreach ($questions as $q)
            {
                echoQuestionData($q);
            }
        }
    }

    function renderTotalRow($name, $key, $totals, $averages)
    {
        ?>
        <?php
            echo $name . "\r\n";
            echo ',';
            for($i = 1; $i <= 5; $i++)
                echo $totals[$key][$i] . ',';
            echo formatAverage($averages[$key]) . "\r\n";
        ?>
    <?php
    }
}
?>

<?php echo $info->subject . ' ' . $info->number . '-' . $info->section . ': ' . $info->title . "\r\n"; ?>
<?php echo $info->instructor. ',' .$info->term. ' ' .$info->year . "\r\n"; ?>

<?php
    echo 'Tenure-Related Questions' . "\r\n";
    renderQuestionSection($qRequired);

    echo 'Optional Questions' . "\r\n";
    renderQuestionSection($qOptional);

    echo 'ABET Questions' . "\r\n";
    renderQuestionSection($qAbet);

    echo 'Departmental Questions' . "\r\n";
    renderQuestionSection($qDepartmental);

    echo 'Overall Comments' . "\r\n";
    if(count($generalComments) == 0)
    {
        echo 'No such data' . "\r\n";
    }
    else
    {
        foreach($generalComments as $comment)
        {
            echo $comment . ',';
        }
        echo "\r\n";
    }

    echo 'Score Totals' . "\r\n";
?>
