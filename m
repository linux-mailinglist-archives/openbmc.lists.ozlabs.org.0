Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A91BD227
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 04:18:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BhyH1XrFzDqjH
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 12:18:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j50KGAL6; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BhxS1BCczDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 12:17:47 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id m18so413286otq.9
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 19:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IEPMGU0FTKl/awe89T/FNct3sFwMHG6Z4K3c0/Xngog=;
 b=j50KGAL6uOLVia2DfT6sp6DNd11xf3/NABlPYV9wpsZvusp8Dtjely6xAZRsl1aiOQ
 Z2FmYSDhCSfJVZmWZOwdsVyE+d/bxl6/ee/YTBKs1h9DiLTQ+q43aGjUGSFLFlmxpVpu
 u4aK3QWtrtBtg1ZtaB3FzRum0W4HFyB2LqBOF/fZrXmAwO4PMav0IzRXQwK20axR/JN/
 fYJH3CJMXc+ve7dVYrsJPK07tKMRcje8zqXfoPJZEMZNtbQWNItqWBQwvwua6sFmxsY1
 rCGslOZR/oyBw+pHkfH66cp0zJP/32cTM97IDy9ZVTVZm4R7g1c7pw2qn/MYsNJjeuHc
 v6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IEPMGU0FTKl/awe89T/FNct3sFwMHG6Z4K3c0/Xngog=;
 b=WhWqT1VD2tc+L7UFrbaoNZBL69g0nf5ZgBUP0dxxTOPq8ImfzTux+PE5JhVx0pl+Fq
 SFH86G1e81CK+zQRN8NinpFJrLQ78pIVJOkd7KScjN6H+Wb2xrvrGQtIfEJxeywpYHt0
 eezHsWhk98o/QgqQqjjHyJTP1/j+PyrDLB7QNROukFlW+7VxyAnZAGmIZfETv3XLJNZe
 VM5CsZTMw/on0ORE+en4q/PlWSDdgD2yFRz7zast86BP/Vsj+TQb9d2p6CgNtfq62KUY
 fVyi1x1oiftAKyQH5AsJFlOI4fj7v7BWfeKJnKbhCW0RXu6aP6zbCcfgWDOtBmISoTvH
 Q8Wg==
X-Gm-Message-State: AGi0Pubfr3u01JX7INWNk3sl2qHTi8Ald2cLo9jbMerkAEI7k+RpSoxr
 biCDDwppZINnnBBJc1D0QpF9/ZJiWZ8=
X-Google-Smtp-Source: APiQypLslTfaYkJevHvKC7VLzLEeduWjE6XZdvAn4BpSfS7Fq06Et2+zI9hlVPhfkx9cs8Tw+gATXg==
X-Received: by 2002:a9d:923:: with SMTP id 32mr25334709otp.104.1588126664050; 
 Tue, 28 Apr 2020 19:17:44 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:38f0:ce58:ac1d:55b6])
 by smtp.gmail.com with ESMTPSA id y22sm5261909oih.57.2020.04.28.19.17.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 19:17:43 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: dbus interface for SLED reset
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20200424104216.GA26818@heinlein.lan.stwcx.xyz>
Date: Tue, 28 Apr 2020 21:17:42 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB2BA7AD-8E64-45FD-AFA0-255160D8099B@gmail.com>
References: <903F1195-A0B7-416A-8CD9-BDB1E30E0F2B@fb.com>
 <20200424104216.GA26818@heinlein.lan.stwcx.xyz>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Apr 24, 2020, at 5:42 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Thu, Apr 23, 2020 at 06:54:47PM +0000, Vijay Khemka wrote:
>> Hi Andrew,
>> As discussed this in patch review =
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/=
31319/, I have thought of 2 approach to handle this interface.
>>=20
>>=20
>>  1.  As included in patch create a new method Sled Reset in =
xyz/openbmc_project/Chassis/Control/Power.interface.yaml. which can be =
invoked by user for sled reset.
>>  2.  As suggested by many reviewer to have a new chassis instance in =
xyz/openbmc_project/State/Chassis.interface.yaml and use powerCycle =
property for Sled reset. As chassis are named as chassis0-N. What should =
be appropriate name to be used for this instance if we choose this =
option. Can it be chassis-server or I am not getting proper name, please =
suggest.
>=20
> #2 would be my preference.
>=20
> Per xyz/openbmc_project/State/README.md, it is sort of implied that =
the=20
> '{bmc, host, chassis}<instance>' are reserved for those relationships
> but it isn't explicit.  I think we should pick something like
> 'chassis-{system, machine, server}' and add it to the README (I tend
> to like "server" least because switches don't seem to like to be =
called a
> server).

Yeah, I hadn=E2=80=99t thought about adding something like =
chassis-system%i

I like that, so it would look like this to power cycle the sled?

busctl set-property xyz.openbmc_project.State.Chassis.System
           /xyz/openbmc_project/state/chassis-system0
           xyz.openbmc_project.State.Chassis
           RequestedPowerTransition s
           xyz.openbmc_project.State.Chassis.Transition.PowerCycle

>=20
> --=20
> Patrick Williams

