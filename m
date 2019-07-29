Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B1C792AE
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 19:56:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y6nC58MgzDqDJ
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 03:56:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rL/YKN2x"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y6mX54ltzDqNH
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 03:55:39 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id f20so19401240pgj.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=L4Lrq2n3fj9SyXGyN8xSAS+tlSvQ1q5YuGEI18xx3Lo=;
 b=rL/YKN2xlUzXOAVgILC7ynKCBYetMlWXSbWJHAEhmE3tAmvOAubhx7RBGdGhv9Sbws
 PLjcSHBchDp7cRlDBlY6E2syYhYJYEDkvQj5k5avJR3Liw/XfxaWN26XmHYDOgVSfWjA
 nrasuGQCkp2J5DGCa19Sx7nI/0Znq2rDyZEKmbOUV2mCmOeWAb/zFS25TlHwLLo+Z35w
 gfWey8Vsl5HI8nAkvuTMPkAJt570KTbSSHs3icU8GxSb6UmZ/q9qG/Ndtntue83zXw7l
 M+g4th1NbQp2Lg7fCdmgYWw+yoKjUtmsLoIB5WWBRalQQYiUo2n79Ot5jPc+MApw+IHk
 eD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=L4Lrq2n3fj9SyXGyN8xSAS+tlSvQ1q5YuGEI18xx3Lo=;
 b=qb/Sr2XAh0KzTgg0ZhFuonf9TKHqPBAf65MPxKMTtQoDB8iPgLDm7mvwjiv4HT/lEr
 3DYwe6slUEqU98kgB3SB3pWJZxeRmk8LMVuhScJxFudrqImvEebaNFk0Oea5wur9Qz/8
 gJ/+8TFnViXb2X8vjNC4hr7EI7tW+CDpDeRNRQnaAVns3vD76n07XsXuuxm7uBVKl25M
 GL7E1oJ7QceUJdZYu2uLcGa33tG70gy4crZ4QLU0ITyNJBFDBRmtDhWdWQozdlqMRp5w
 r5UjrYNP7Ch/jqDFgu9IHgBLsZ/a0LvGp5Jgra6wvIknMV1+fvHJHSd8U0QS4ldF3jcv
 +vLQ==
X-Gm-Message-State: APjAAAXbHSx8RTH9pg+3Y0YL4ITSB+MkQ6hQBNU4ZszszoL6/Y65XnB+
 1Dez1TxRbzupZ8Ljez8QvcL32fnudj/srPTiw2agwQ==
X-Google-Smtp-Source: APXvYqyNOqwiEk1tROoqI2BU2nPrrxbyRRiDCSiysHuJowgOhUR/Bhjvv24jUKUZ4AzCGC+Lra6dK1Lge/ICuUlb3ec=
X-Received: by 2002:a17:90a:23a4:: with SMTP id
 g33mr116448285pje.115.1564422935533; 
 Mon, 29 Jul 2019 10:55:35 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Jul 2019 10:55:24 -0700
Message-ID: <CAO=notyvYn5-VTKys86NVzXXturPh=Q-5DFsR_ZvGeoJs=P0PQ@mail.gmail.com>
Subject: entity-manager exposing eeproms
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi;

Sorry to flood with questions, but I'm hoping I won't be the only
person asking and in the future, other machines starting to use
entity-manager will find these useful.

I've added the following configuration:

cat configurations/semitruck.json
{
    "Exposes": [
        {
            "Address": "0x50",
            "Bus": 14,
            "Name": "Aberdeen",
            "Type": "24C64"
        },
        {
            "Address": "0x50",
            "Bus": 15,
            "Name": "Energia",
            "Type": "24C64"
        }
    ],
    "Name": "Aberdeen Baseboard",
    "Probe" : "TRUE",
    "Type": "Board"
}

And I see:
i2c i2c-14: new_device: Instantiated device 24c64 at 0x50
i2c i2c-15: new_device: Instantiated device 24c64 at 0x50

And I see:
Service xyz.openbmc_project.EntityManager:
`-/xyz
  `-/xyz/openbmc_project
    |-/xyz/openbmc_project/EntityManager
    `-/xyz/openbmc_project/inventory
      `-/xyz/openbmc_project/inventory/system
        `-/xyz/openbmc_project/inventory/system/board
          |-/xyz/openbmc_project/inventory/system/board/Aberdeen_Baseboard

busctl introspect xyz.openbmc_project.EntityManager
/xyz/openbmc_project/inventory/system/board/Aberdeen_Baseboard
--no-pager
NAME                                     TYPE      SIGNATURE
RESULT/VALUE         FLAGS
org.freedesktop.DBus.Introspectable      interface -         -
           -
.Introspect                              method    -         s
           -
org.freedesktop.DBus.Peer                interface -         -
           -
.GetMachineId                            method    -         s
           -
.Ping                                    method    -         -
           -
org.freedesktop.DBus.Properties          interface -         -
           -
.Get                                     method    ss        v
           -
.GetAll                                  method    s         a{sv}
           -
.Set                                     method    ssv       -
           -
.PropertiesChanged                       signal    sa{sv}as  -
           -
xyz.openbmc_project.AddObject            interface -         -
           -
.AddObject                               method    a{sv}     -
           -
xyz.openbmc_project.Inventory.Item.Board interface -         -
           -
.Name                                    property  s         "Aberdeen
Baseboard" emits-change
.Probe                                   property  s         "TRUE"
           emits-change
.Type                                    property  s         "Board"
           emits-change

For the two eeproms listed, neither are currently supported by
FruDevice.  It's my understanding that entity-manager "exposes"
things, and I see it adding the eeproms successfully -- but then
doesn't populate them to dbus.  It populates a configuration space for
the sensors, so I expected the same for eeproms.

Am I missing something, or?

Thanks,
Patrick
