Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A926935A
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 19:30:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqtg529fJzDqKl
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 03:30:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=XnmYnEud; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqtdH3sYWzDqQs
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 03:29:07 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id h206so448257ybc.11
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DBNj8xDjJzhSKrNXc5vSVVTMq6PT2PSJclIBOKq0mvQ=;
 b=XnmYnEudZDhNlB5XHEKkhBcXBNbfyvlJuLDHL6Klj8Niyl4BOLyA84IlRBbwvRLyAm
 6+kd3orwnJ82pwrvdmJbOwpDexlJ8Pp2Rj3/j1YXS7tOz4ZnSzGasXrM4Gd2h1PddPZU
 7gan+9qC5GmWQqeFf+m0YsEQ7vH08B5Ru3icPl8z3FC+4pCM2EOmO5LHx4VK+/ToUxQ2
 Eo5hzgNKBQ8obwKbhdky9Ni5TDy1lAGlUi48XhQHHcShpMYycEYAI7mlyuSeLt3eTmSZ
 SVUWT5RHE6wl1+O9BbyQluShpHedbk4kRlu405EjAVDzAC+TdOz9LbwLW60ATHqjGMb1
 Mh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DBNj8xDjJzhSKrNXc5vSVVTMq6PT2PSJclIBOKq0mvQ=;
 b=mHT4g9+6aKSbUNBtq6mDfZFqJxks+bBTbkif4fLSk10zo1Yt6+qeGQcGtXm5CjOeuv
 bg8DmhqCMinOI36J367EJ+LvN3qOzHihmzbIWX2EiqFE57lcrdO3fQfup2me0jhwnosX
 ygwA+P1JVPdeke5/bfrvrjWXxL8Jd7EqImfjFtPfl4Zd6BiwEWrRFq02iizf91zmOvUR
 dM2Ysfb3oMRfjwAxy7NODJ8T9PKu+IfAWaFs5B1jm3gghV6KbmNnaD9MysZGOzIXex7n
 kr/+Or0usQglE1cwkeeqItS9EnqK1nU+ahfuUz2Eq7DGr43gAHI4+dlTq9/SRF3c3wAV
 tW8Q==
X-Gm-Message-State: AOAM530uPIAONNo3nXRGar60iALYVA5TvxgL4qadmZLNNw93PhYJqD9e
 ho8iNGvgby/qMFXY+1klLYs+tDadghK8u8FkliTCHw==
X-Google-Smtp-Source: ABdhPJzsxZIqS44w1c20hm0i7fTuMjym4nsdSvDoJY9HbOv+UIy7Bl9zIi0+1bXLZ5nOTBjKuo4rOP2Tfe331dey5HE=
X-Received: by 2002:a5b:f47:: with SMTP id y7mr20312416ybr.340.1600104544080; 
 Mon, 14 Sep 2020 10:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 14 Sep 2020 10:28:52 -0700
Message-ID: <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
Subject: Re: Read FRU of host through ipmi in Entity manager.
To: Kumar Thangavel <thangavel.k@hcl.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrickw3@fb.com>, James Feist <james.feist@linux.intel.com>,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 "vijaykhemka@fb.com" <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 14, 2020 at 9:57 AM Kumar Thangavel <thangavel.k@hcl.com> wrote=
:
>
> Classification: HCL Internal
>
> Hi All,
>
>
>
>          We are working on the Platform which has multi host and the host=
 are FRUs.  The host and BMC communication is based on IPMB. We have each h=
ost is connected in separate ipmb bus.
>
>          Existing Entity manager has the FRU read info from EEPROM (I2C)i=
n the form of bin file.
>          We understand that entity manager does not support ipmb based ho=
st fru.

Minor adjustment.  FruDevice has this capability, not Entity Manager.

>
>
>
>          So, we are proposing the design to support ipmb based FRU in ent=
ity manager.
>          From Entity manager, we will send the generic "read host fru" co=
mmand request to ipmbbrige to read the host FRU.
>
>          Then, store the host fru info in the bin file to process and cre=
ating dbus objects in the entity manager.

Minor amendment again.  I'd much rather the IPMBSensor daemon simply
create the same interface that fru device does, rather than adding
IPMB logic to FruDevice.  In this way, platforms that don't have IPMB
don't need to include the feature at all.  Also, all the IO can be
managed in one place.
https://github.com/openbmc/dbus-sensors/blob/master/src/IpmbSensor.cpp
Ideally, your IPMB device would also have an SDR that details what
FRUs and sensors exist, so that the inventory can be read and posted
to DBus at startup.  If they don't then we might need a static mapping
from an EM config once the device on the other end is detected via get
device ID.


>
>
>
>          Please let us know your comments on this.
>
>
>
> Thanks,
>
> Kumar.
>
>
>
>
>
>
>
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only. E-mail transmission is not guarante=
ed to be secure or error-free as information could be intercepted, corrupte=
d, lost, destroyed, arrive late or incomplete, or may contain viruses in tr=
ansmission. The e mail and its contents (with or without referred errors) s=
hall therefore not attach any liability on the originator or HCL or its aff=
iliates. Views or opinions, if any, presented in this email are solely thos=
e of the author and may not necessarily reflect the views or opinions of HC=
L or its affiliates. Any form of reproduction, dissemination, copying, disc=
losure, modification, distribution and / or publication of this message wit=
hout the prior written consent of authorized representative of HCL is stric=
tly prohibited. If you have received this email in error please delete it a=
nd notify the sender immediately. Before opening any email and/or attachmen=
ts, please check them for viruses and other defects.
> ________________________________
