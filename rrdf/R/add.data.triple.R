# Copyright (C) 2011  Egon Willighagen <egon.willighagen@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details. 
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

add.data.triple <- function(store,
		subject="http://example.org/Subject",
		predicate="http://example.org/Predicate",
		data="Value",
		type=NULL, lang=NULL) {

	if (!is.null(type) && !is.null(lang)) {
	    stop("The parameters type and lang cannot be set at the same time.");
	}

	if (!is.null(type)) {
		.jcall(
			"com/github/egonw/rrdf/RJenaHelper",
			"V",
			"addDataProperty", store,
			subject, predicate, data,
			type
		)
	} else if (!is.null(lang)) {
		.jcall(
			"com/github/egonw/rrdf/RJenaHelper",
			"V",
			"addDataPropertyLang", store,
			subject, predicate, data,
			lang
		)
	} else {
		.jcall(
			"com/github/egonw/rrdf/RJenaHelper",
			"V",
			"addDataProperty", store,
			subject, predicate, data
		)
	}
}
