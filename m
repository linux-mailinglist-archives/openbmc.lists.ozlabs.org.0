Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B0C29E393
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 07:34:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMFz71fkhzDqVH
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 17:34:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=iGtZV/7e; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMFyL4pylzDqXD
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 17:33:46 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5CD364131F;
 Thu, 29 Oct 2020 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1603953218; x=1605767619; bh=cu/96m7OHLSnr8DK+zPoEtyaz
 knkft8aBRJtROpjGro=; b=iGtZV/7eU+dRWj8S+rWgYkSs4PKjHwB/q9YM4Mop3
 p0flLf2GUtj6KqzucIy6CNiswE7Pw+230ITCrzUZeiSX0BqDJPDlOw7bkirGeIC9
 TkjcCvMh7z4kpHCdG//uCb73GmgjXxIHWFttOhFsdkAqA+6SX+R7tRdOylpFnzTH
 7k=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkBxtDMfg7IY; Thu, 29 Oct 2020 09:33:38 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 832434127F;
 Thu, 29 Oct 2020 09:33:38 +0300 (MSK)
Received: from [10.199.0.66] (10.199.0.66) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 29
 Oct 2020 09:33:37 +0300
Message-ID: <43c29691e942590edb62f02757bf93e175537243.camel@yadro.com>
Subject: Re: New fru bus interfaces
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Ed Tanous <ed@tanous.net>, Vijay Khemka <vijaykhemka@fb.com>
Date: Thu, 29 Oct 2020 09:33:37 +0300
In-Reply-To: <CACWQX825kGcNJ9PfsuDZk1Bghdv9SRuZiu7FF2Fz+yiDqp_9xw@mail.gmail.com>
References: <4D8141F3-33DC-48F5-99BA-9099044E6A60@fb.com>
 <CACWQX825kGcNJ9PfsuDZk1Bghdv9SRuZiu7FF2Fz+yiDqp_9xw@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.66]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Hi Ed,

I don't think this commit related to this issue. On our system we have
similar /xyz/openbmc_project/FruDevice/X_YY entries, but I didn't
bother about. My work was about real FRUs with broken content.
This entries are created by FruDevice for addresses is can't detect as
EEPROM:

# busctl tree xyz.openbmc_project.FruDevice
└─/xyz
  └─/xyz/openbmc_project
    └─/xyz/openbmc_project/FruDevice
      ├─/xyz/openbmc_project/FruDevice/12_81
      ├─/xyz/openbmc_project/FruDevice/12_82
      ├─/xyz/openbmc_project/FruDevice/12_83
      ├─/xyz/openbmc_project/FruDevice/12_84
[...]
# i2cdetect -y 12
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- 51 52 53 54 -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --                         

In this case, there are pmbus VRs on that addresses.
Actually, now I see, it creates such nodes for some EEPROM nodes too:

# busctl tree xyz.openbmc_project.FruDevice
[...]
      ├─/xyz/openbmc_project/FruDevice/7_80
      ├─/xyz/openbmc_project/FruDevice/7_82
      ├─/xyz/openbmc_project/FruDevice/7_88
      ├─/xyz/openbmc_project/FruDevice/7_90
      ├─/xyz/openbmc_project/FruDevice/S_1100ADU00_201
[...]

# busctl introspect xyz.openbmc_project.FruDevice
/xyz/openbmc_project/FruDevice/S_1100ADU00_201
NAME                                TYPE      SIGNATURE RESULT/VALUE      FLAGS
[...]
xyz.openbmc_project.FruDevice       interface -         -                 -
.ADDRESS                            property  u         82                emits-change
.BUS                                property  u         7                 emits-change
[...]

# busctl introspect xyz.openbmc_project.FruDevice /xyz/openbmc_project/FruDevice/7_82           
NAME                                         TYPE      SIGNATURE RESULT/VALUE FLAGS
org.freedesktop.DBus.Introspectable          interface -         -            -
.Introspect                                  method    -         s            -
org.freedesktop.DBus.Peer                    interface -         -            -
.GetMachineId                                method    -         s            -
.Ping                                        method    -         -            -
org.freedesktop.DBus.Properties              interface -         -            -
.Get                                         method    ss        v            -
.GetAll                                      method    s         a{sv}        -
.Set                                         method    ssv       -            -
.PropertiesChanged                           signal    sa{sv}as  -            -
xyz.openbmc_project.Inventory.Item.I2CDevice interface -         -            -
.Address                                     property  u         82           emits-change
.Bus                                         property  u         7            emits-change

But I didn't investigate this topic before.


On Wed, 2020-10-28 at 15:26 -0700, Ed Tanous wrote:
> On Wed, Oct 28, 2020 at 2:43 PM Vijay Khemka <vijaykhemka@fb.com>
> wrote:
> > Team,
> > 
> > I am seeing now new interfaces added to dbus for FRU devices which
> > has no fru device. I am using EM/FruDevice application and it scans
> > dynamically all i2c busses for Fru devices. And it used to list
> > only devices with Fru data only to dbus but current image adds all
> > i2c bus scanned as dbus interfaces. Please see below
> > 
> > 
> > 
> > root@tiogapass:~# busctl tree xyz.openbmc_project.FruDevice
> > 
> > └─/xyz
> > 
> >   └─/xyz/openbmc_project
> > 
> >     └─/xyz/openbmc_project/FruDevice
> > 
> >       ├─/xyz/openbmc_project/FruDevice/0_80
> > 
> >       ├─/xyz/openbmc_project/FruDevice/0_81
> > 
> >       ├─/xyz/openbmc_project/FruDevice/2_109
> > 
> >       ├─/xyz/openbmc_project/FruDevice/2_112
> > 
> >       ├─/xyz/openbmc_project/FruDevice/2_16
> > 
> >       ├─/xyz/openbmc_project/FruDevice/2_22
> > 
> >       ├─/xyz/openbmc_project/FruDevice/3_104
> > 
> >       ├─/xyz/openbmc_project/FruDevice/3_108
> > 
> >       ├─/xyz/openbmc_project/FruDevice/3_113
> > 
> >       ├─/xyz/openbmc_project/FruDevice/3_36
> > 
> >       ├─/xyz/openbmc_project/FruDevice/3_68
> > 
> >       ├─/xyz/openbmc_project/FruDevice/3_81
> > 
> >       ├─/xyz/openbmc_project/FruDevice/4_112
> > 
> >       ├─/xyz/openbmc_project/FruDevice/4_22
> > 
> >       ├─/xyz/openbmc_project/FruDevice/6_33
> > 
> >       ├─/xyz/openbmc_project/FruDevice/6_80
> > 
> >       ├─/xyz/openbmc_project/FruDevice/7_69
> > 
> >       ├─/xyz/openbmc_project/FruDevice/9_39
> > 
> >       ├─/xyz/openbmc_project/FruDevice/9_84
> > 
> >       ├─/xyz/openbmc_project/FruDevice/Ava_M_2_SSD_Adapter
> > 
> >       └─/xyz/openbmc_project/FruDevice/Tioga_Pass_Single_Side
> 
> Is that related to this commit?
> 
> https://github.com/openbmc/entity-manager/commit/d7b6659944c3527622d454526509a0a8697ada0f
> 
> > 
> > 
> > In above tree there are only last 2 interface represent real Fru
> > device, rest others have no Fru data. I am not sure why this was
> > added.
> > 
> > 
> > 
> > Please help me understand this feature if anything new added to the
> > application.
> > 
> > 
> > 
> > Regards
> > 
> > -Vijay
-- 
Best regards,
Andrei Kartashev


