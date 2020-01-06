Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39212131A6F
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 22:30:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s7wW4crjzDqDJ
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 08:30:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RBHMRDBs"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s7vW5lbzzDqBS
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 08:29:59 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id d7so68998151otf.5
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 13:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jluTMcVplMDlYFD5AW2wGAs0XtJIWcA6e9Tu24bhr9w=;
 b=RBHMRDBs2AEIY5LsOpFfxeR/tLNKNRbnOjwQT+hgXhHSbIo1MEzgXAE2RsEkoW6zEt
 GLlelIaesq6CMzwByWmzGgWRl313FKDFoc6SOFDPM5JxQCE602SOYbiQ61RQPwtR0Pqt
 7DHlXracHwoHCmf/n6PIk942Qb1EVM6m3M/p4JofXflvS49o66qE5UpPRMSUFnRHnTC8
 juGYCWQnRWAjEyFKZQh+SEymLjjkHrDQ3XrS9q4oMLXuzKniEtkxGjNqNxD5N0m5j2s/
 N2hC7Qu/U0th2F16orsf7Sc/KTPPcW4egV5QE0zZ639ngU2Bz5DTJ6sDvRD2/MrSWdNj
 YfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jluTMcVplMDlYFD5AW2wGAs0XtJIWcA6e9Tu24bhr9w=;
 b=itlm6XDDid/WHTaaFj/tORxQ7T+gcoBMixPx6zkPAso8O8xN9Rme69OoNpy9DUkZRQ
 tMK6oogVRnWqPSneGcqkoINXelG4pLxEG5UJpmMNNah8qX4tFEHc9JvErfQ2khOi2V3p
 9eSCWE6e5I72FIFa3FMJwbo435YZFi/2xxmn0OVVnwyYem/1yvGfhVwFDIEO9KRBPYwv
 zxVFUz0UMwBkgLomKrnO1DMVOuDwkt145f87nOCRVb0EDAhRyI6GK3AQ+7XbLmRf9IFt
 QEvBonihf/4ogBtcB3y0Yn9CpLv2rJ9hnIL0lZhMXNz65ivj6mIx1Kb4aYIw1vXqHLq0
 +ecw==
X-Gm-Message-State: APjAAAV7giSEWN9sfvwDk/VMKfXr3Tk7dHCAlLHQCX9qNKYuXaHk+bSb
 mCoUeapwgUu0nF4U8L/XR6NGyLlQg+lJVCrKi8cUDg==
X-Google-Smtp-Source: APXvYqzwSc4C6RnEvMLPWBByrr4W1kUyGrAXrwtu2VRBdbqoI4U/53T9FWUnZcTVipR10Qp0WsrRQRfe+F1s831RzsI=
X-Received: by 2002:a9d:7b51:: with SMTP id f17mr877872oto.302.1578346195614; 
 Mon, 06 Jan 2020 13:29:55 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
 <e5878df7-b127-0f86-3366-722e94f86103@linux.intel.com>
In-Reply-To: <e5878df7-b127-0f86-3366-722e94f86103@linux.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 6 Jan 2020 13:29:44 -0800
Message-ID: <CAA_a9x+wpvhD7pEe+TEqkjSb6ZoiiYz4ZZBQz0v_7V-cGywHXg@mail.gmail.com>
Subject: Re: Configuring shunt_resistor in hwmon
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000052dade059b7f5ca6"
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
Cc: Josh Lehan <krellan@google.com>, openbmc@lists.ozlabs.org,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000052dade059b7f5ca6
Content-Type: text/plain; charset="UTF-8"

Hi James,

Thanks for your quick reply and reviewing my code in the morning!

That looks interesting, so this ScaleFactor will be used to multiply the
voltage value from hwmon without setting the shunt_resistor explicitly? I
do have a little concern on the resolution, because it's only reporting
0.165V with default shunt_resistor setting, but we'll try and see if this
will work for our case. In the meantime, do you know any other method that
will work?

Thank you!

- Alex Qiu


On Mon, Jan 6, 2020 at 1:21 PM James Feist <james.feist@linux.intel.com>
wrote:

> On 1/6/20 1:16 PM, Alex Qiu wrote:
> > Hi OpenBMC folks,
> >
> > Is there a way to configure the shunt_resistor value for a hwmon with
> > entity-manager or other modules?
>
> Have you seen this?
>
> https://github.com/openbmc/entity-manager/blob/0cbe6bf34101bab7544b40011868efc5145c0804/configurations/WFT%20Baseboard.json#L7
>
> For Entity-Manager + dbus-sensors.
>
> > We need to configure this value to make
> > the INA230 report correct voltage, but for now I don't find anything in
> > the code for it. Shall this be a feature to implement? Thanks!
> >
> > - Alex Qiu
>

--00000000000052dade059b7f5ca6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>Thanks for your quick reply a=
nd reviewing my code in the morning!</div><div><br></div><div>That looks in=
teresting, so this ScaleFactor will be used to multiply the voltage value f=
rom hwmon without setting the shunt_resistor explicitly? I do have a little=
 concern on the resolution, because it&#39;s only reporting 0.165V with def=
ault shunt_resistor setting, but we&#39;ll try and see if this will work fo=
r our case. In the meantime, do you know any other method that will work?</=
div><div><br></div><div>Thank you!</div><div><br clear=3D"all"><div><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr">- Alex Qiu</div></div></div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 6, 2020 at 1=
:21 PM James Feist &lt;<a href=3D"mailto:james.feist@linux.intel.com">james=
.feist@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 1/6/20 1:16 PM, Alex Qiu wrote:<br>
&gt; Hi OpenBMC folks,<br>
&gt; <br>
&gt; Is there a way to configure the shunt_resistor value for a hwmon with =
<br>
&gt; entity-manager or other modules?<br>
<br>
Have you seen this? <br>
<a href=3D"https://github.com/openbmc/entity-manager/blob/0cbe6bf34101bab75=
44b40011868efc5145c0804/configurations/WFT%20Baseboard.json#L7" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/openbmc/entity-manager/blob/0c=
be6bf34101bab7544b40011868efc5145c0804/configurations/WFT%20Baseboard.json#=
L7</a><br>
<br>
For Entity-Manager + dbus-sensors.<br>
<br>
&gt; We need to configure this value to make <br>
&gt; the INA230 report correct voltage, but for now I don&#39;t find anythi=
ng in <br>
&gt; the code for it. Shall this be a feature to implement? Thanks!<br>
&gt; <br>
&gt; - Alex Qiu<br>
</blockquote></div>

--00000000000052dade059b7f5ca6--
