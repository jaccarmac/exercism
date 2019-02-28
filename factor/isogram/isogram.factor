USING: sequences sets unicode ;
IN: exercism.isogram

: isogram? ( word -- isogram? ) [ alpha? ] filter >lower all-unique? ;
