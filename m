Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161314847FE
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 19:39:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT1cC6HKpz3017
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 05:39:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pvgZmyVU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=pvgZmyVU; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT1bm4CVRz2xsg
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 05:38:58 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id j18so77957981wrd.2
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9j+NtHtqterxGezlyKuLZZj7B6+QzdzXoZv8XK9Ej6M=;
 b=pvgZmyVUa3MBrIYHqwByGS6HsmuL/0sqhKkbdcGaI3Qo7UNnMxldoQ1ovFZxakVArz
 iDHe7pz78/SZTHYXrx+EyrQAVm1YXm3PZgdgCjkqo4R3UP1FGrr/zlkYPeuK+a4K+lsw
 1DFwynsuEO4lbcXmYyhZSv58Syur134iJ0fBsYoAtKrIhbvsXfeSukVpFmQuMMuqr4yk
 vV9ew/zVkFFplfIox1cXfT3LjBhQ1WGMJ0xfom3/xxvM1Nip8VokFlDZJ405Ud6LsLjB
 /4zbEuBRPjivPdCTzMsonKIThN2ac9KpRMcheYt2sfBr2YzdXNoZaVcLXUXunc4qVz9R
 xjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9j+NtHtqterxGezlyKuLZZj7B6+QzdzXoZv8XK9Ej6M=;
 b=zeRtbJN8D9tZfZcGVN7qCUuOU9HgiqUoQVJMMzXebTYeeSSNdeiGbuPQrtWg29XsMX
 0HIc0Vbqq2cQhUt6r3dkQdmzzLX5Z9AEMTy9xM5P/kBMo0ssVTnepXXBL+TqBHpP+E7Y
 UTIKQv+mXfMGMBG+drLb+mLOP5oU76HGpT6FdCTJYYsPx9EP7BzqTB82FUhGVhK4Zsqz
 DtXitaB7SZUAgQYq2FI9hhL7G6PJ//A7d5g4QyuzOHPpBrlU53yRddCz/06l++o92bhe
 MV2s0uvDpq5Rjsdb9dpzlNBrTjKchBZInj/f/4NXQKgC07Jpev4RZ3V7XLLX8ouWRMWd
 5lew==
X-Gm-Message-State: AOAM532+TVLT/nAolWM/JsqGzQsYq0GMCzMzb9OoHEvrm86aR/toguJF
 qPkIOufp+A/gIA46cLxCq7LNZn9lp2ye1pOfJSD+sA==
X-Google-Smtp-Source: ABdhPJyXZ5nSyIOO17044FhCZ2UhaC6HWd0kmuM1soNen6+t13Qy1MNogiuONWNIXVO52Tt2HNHilFjb0yPpFHFSAT0=
X-Received: by 2002:a5d:6e90:: with SMTP id k16mr24082425wrz.112.1641321534475; 
 Tue, 04 Jan 2022 10:38:54 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80hcLXJrvXmg45v6L89_Ks__qc5MqUETGyvKeaqxzqY-w@mail.gmail.com>
 <8589D844-7432-4C87-9CF0-71C6303228DF@stwcx.xyz>
In-Reply-To: <8589D844-7432-4C87-9CF0-71C6303228DF@stwcx.xyz>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 4 Jan 2022 10:38:43 -0800
Message-ID: <CAH2-KxBMht4OaoVi=ceVa3w46Gp_Ejbfcv+M7apVtZj4Up1c0Q@mail.gmail.com>
Subject: Re: hwmontempsensor issue in dbus-sensor
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Jayashree D <jayashree-d@hcl.com>,
 Kumar Thangavel <kumarthangavel.hcl@gmail.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 3, 2022 at 1:09 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Ed,
>
> I think there are other commits needing the IIO functionality now. There =
is at least the pending commit for Humidity that we=E2=80=99d like to get m=
erged. I think it is better to move forward with a fix rather than backward=
s with a revert at this point.

Sure, if there are patches available to fix the regression, I'm happy
to avoid the revert.  I'll let this sit another day or two to see if
someone puts up a patch to fix the issue, but after that, we need to
unbreak master, and in the absence of a patch to fix it, a revert is
the next best option.

>
> Kumar/Jayashree,
>
> Can you dig into this and get to the bottom of it?
>
> - Patrick
> Sent from my iPhone
>
> > On Jan 3, 2022, at 11:21 AM, Ed Tanous <ed@tanous.net> wrote:
> >
> > =EF=BB=BFOn Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell
> > <bruce.mitchell@linux.vnet.ibm.com> wrote:
> >>
> >>> On 12/20/2021 10:29, Ed Tanous wrote:
> >>> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
> >>> <kumarthangavel.hcl@gmail.com> wrote:
> >>>>
> >>>> Hi All,
> >>>>
> >>>> Gentle Reminder on this.
> >>>>
> >>>> Thanks,
> >>>> Kumar.
> >>>>
> >>>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <kumarthangavel.hcl@=
gmail.com> wrote:
> >>>>>
> >>>>> Hi All,
> >>>>>
> >>>>>
> >>>>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sen=
sor.
> >>>>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7=
d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1=
568e5341b22b7ab
> >>>
> >>> Bruce, this is your patch.  Could you take a look at the below and
> >>> provide your input?
> >>>
> >>>>>
> >>>>>
> >>>>> While testing those changes in my platform, I found that each senso=
r in hwmon temp has been creating twice.
> >>>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor i=
s created twice.
> >>>>>
> >>>>>
> >>>>> /sys/class/hwmon/hwmon2/temp2_input
> >>>>> /sys/class/hwmon/hwmon2/temp1_input
> >>>>>
> >>>>>
> >>>>> Before your change, hwmon temp sensor will check whether the path i=
s already exists or not.
> >>>>> If it exists, it will skip and proceed with next path.
> >>>>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7=
d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1=
568e5341b22b7abL96
> >>>>>
> >>>>>
> >>>>> Could you please explain why it is creating twice in hwmon temp ?
> >>>>>
> >>>>>
> >>>>> Journalctl log before your changes applied :
> >>>>>
> >>>>>
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class=
/hwmon/hwmon2/temp2_input"
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type : xyz.openbmc=
_project.Configuration.TMP421
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_T=
EMP
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/o=
penbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/o=
penbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class=
/hwmon/hwmon2/temp1_input"
> >>>>>
> >>>>>
> >>>>>
> >>>>> Journalctl log after your changes applied :
> >>>>>
> >>>>>
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class=
/hwmon/hwmon2/temp2_input"
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.=
openbmc_project.Configuration.TMP421
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_T=
EMP
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbm=
c_project/sensors/temperature/SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbm=
c_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>>>
> >>>>>
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class=
/hwmon/hwmon2/temp1_input"
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.=
openbmc_project.Configuration.TMP421
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_T=
EMP
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbm=
c_project/sensors/temperature/SP_OUTLET_TEMP
> >>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbm=
c_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>>>
> >>>>>
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>> Kumar.
> >>
> >> I will give it quick look today.  Also today is my last day at IBM.
> >>
> >
> > Do you plan on continuing this beyond your tenure at IBM?  If not, is
> > someone taking this feature over for you?  Given it's been a few weeks
> > since this regression was reported, and I don't see any fixes in
> > review, I'm leaning toward reverting it on master for the time being
> > until someone puts up a patch to fix the issue.
>
