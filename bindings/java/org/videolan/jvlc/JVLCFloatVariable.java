package org.videolan.jvlc;

/*****************************************************************************
 * JVLC.java: global class for vlc Java Bindings
 *****************************************************************************
 * Copyright (C) 1998-2004 the VideoLAN team
 *
 * Authors: Filippo Carone <filippo@carone.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111, USA.
 *****************************************************************************/

/**
 * This class is part of JVLC<Type>Variable pool.
 */
public class JVLCFloatVariable extends JVLCVariable {

    public JVLCFloatVariable(String name, float value) throws JVLCNoSuchVariableNameException {
        super(name);
        this.value = new Float(value);
    }

    public float getFloatValue() {
        return ((Float)value).floatValue();
    }

}
