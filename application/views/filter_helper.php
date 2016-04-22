<?php

function printFilter($title, $name, $values)
{ ?>
    <div class="form-group">
        <label for="<?php echo $name; ?>" class="col-sm-4 control-label"><?php echo $title; ?></label>

        <div class="col-sm-8">
            <select name="<?php echo $name; ?>" id="<?php echo $name; ?>" class="form-control">
                <option value="*">*</option>
                <?php
                foreach ($values as $val)
                {
                    echo "<option>$val</option>";
                }
                ?>
            </select>
        </div>
    </div>

<?php

}

function printAllFilters($courses)
{ ?>

    <div class="form-group">
        <label for="mainSelect" class="col-sm-2 control-label">Courses</label>

        <div class="col-sm-10">
            <select id="mainSelect" size="16" multiple class="form-control">
                <?php
                foreach ($courses as $course)
                {
                    echo "<option value="
                        . $course['c_id'] . ">"
                        . $course['year'] . " "
                        . $course['quarter'] . " "
                        . $course['subject'] . " "
                        . $course['number'] . "-"
                        . $course['section'] . " "
                        . $course['title'] . " "
                        . $course['instructor']
                        . "</option>";
                }
                ?>
            </select>
        </div>
    </div>

<?php } ?>