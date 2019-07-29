Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F87907F
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 18:13:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y4Vr2zqLzDqS3
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 02:13:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mWLm6TWt"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y4T71X3PzDqQT
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 02:12:10 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id s1so22195076pgr.2
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=w3XUx+jtkM91P38NJLC60Y6KkqscJcCfiQv5BjZZMrc=;
 b=mWLm6TWt70FV4pF3OTSPL8q4c2nZ6F5yBIyOtxSoDmRIwnWCdD/EjAFW9IJQRJ6wD9
 ovfZVLa5y8dSSt/dWae9cHz4HWtbXGvG79d1BdeOWYohv0LidvFuBOfhyFaIQq/Na4YD
 rUCWYM+WyyXk+lKsHO5PzUQlOy3hs++Q1AfFbEqP3Dqe1JcSpB9CnPv6Tepxe0T/yScX
 SqXHJWLQ18Q2d2zesfYJFuGWdgOylOgdP6rOR/qOb77tz8WxG/Nifqn7gOcyASfGMO8u
 8F/DndbhzHGvyT3Rk9AsNCx2mAihrtp7qRUlGVglwWP8+tiOAUD2XvVBngINamUVy4gp
 C/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=w3XUx+jtkM91P38NJLC60Y6KkqscJcCfiQv5BjZZMrc=;
 b=H8Fa7uI7IiVBAOf6pnJFeybMVTNs8D3bDsRS5NkUyerG+8voLCQcfSFtR2orB46yV+
 CSTRE3VeXNK/8/+pZBe8ZM8HvMwz9luEuEqmX8Qn1KC2RhyGg+f0CwZ1iJZLeTXOHc0B
 1iKOCc8/F93SA2EoMLmO6vFLbU8CA1TuG2g2BLNuu2YOwZUvzjiJwHPZbqtG6m+s0h18
 t+c1DoVrWSnLM8oHGWQaXdOolvU4NrNR3IvkUc42M4ShLjLkWlpod4Esi1Kiywn0C977
 nHJ/0irdnFWE9yBV9lNPZNukcEGcKj03DQm93H2D2qxH/F1wSh0hqyPLoxaFHLQsQYR1
 7mVA==
X-Gm-Message-State: APjAAAV+OQrzA6wFOGIGhEO66VMWm2URsTtFnwbUavrverU40Wron1bl
 Ebe+VmO3To1FJ3/G/W4g04z+QfWVntZXTcYE5jRtbw==
X-Google-Smtp-Source: APXvYqyB/0EUZa24Hpl74+gVdgCaibw4PhFM6P+WtXJAtTiDi8jxbL4Q8tdg2c8wF8B3zXpCHgYrD/vnJ8dXl7a1CSw=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr37308826pfi.136.1564416726318; 
 Mon, 29 Jul 2019 09:12:06 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Jul 2019 09:11:55 -0700
Message-ID: <CAO=notwJd4QkJVP2qRiB56DWf+D=qs6S9cMCcfiywpOJZO03mA@mail.gmail.com>
Subject: Limitations of entity-manager:FruDevice
To: James Feist <james.feist@linux.intel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi;

I don't know much about FRUs.  However, I know that for some eeproms
on the device-tree for my platform, the default eeprom driver instance
isn't correct and I need to explicitly use 24c64.

root@semitruck:~# echo "eeprom 0x50" > /sys/bus/i2c/devices/i2c-14/new_device
i2c i2c-14: new_device: Instantiated device eeprom at 0x50
root@semitruck:~#
root@semitruck:~# ls -l /sys/bus/i2c/devices/14-0050/
-r--r--r--    1 root     root          4096 Jul 29 15:20 modalias
-r--r--r--    1 root     root          4096 Jul 29 15:20 name
drwxr-xr-x    2 root     root             0 Jul 29 15:20 power
lrwxrwxrwx    1 root     root             0 Jul 29 15:20 subsystem ->
../../../../../../../bus/i2c
-rw-r--r--    1 root     root          4096 Jul 29 15:20 uevent

root@semitruck:~# echo "24c64 0x50" > /sys/bus/i2c/devices/i2c-14/new_device
at24 14-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
i2c i2c-14: new_device: Instantiated device 24c64 at 0x50
root@semitruck:~# ls -l /sys/bus/i2c/devices/14-0050/
drwxr-xr-x    3 root     root             0 Jul 29 15:46 14-00500
lrwxrwxrwx    1 root     root             0 Jul 29 15:46 driver ->
../../../../../../../bus/i2c/drivers/at24
-rw-------    1 root     root          8192 Jul 29 15:46 eeprom
-r--r--r--    1 root     root          4096 Jul 29 15:46 modalias
-r--r--r--    1 root     root          4096 Jul 29 15:46 name
drwxr-xr-x    2 root     root             0 Jul 29 15:46 power
lrwxrwxrwx    1 root     root             0 Jul 29 15:46 subsystem ->
../../../../../../../bus/i2c
-rw-r--r--    1 root     root          4096 Jul 29 15:46 uevent

For entity-manager, I can add the type and it'll do the right thing.
However, when FruDevice runs first and populates the FRUs, it doesn't
seem to detect the difference in the eeproms.  I don't know enough (as
previously stated) to jump into fixing this, so I wanted to check if
this was a known limitation (presumably) and whether there was a plan
to fix it?

Patrick
