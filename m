Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE1A78F67
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 17:34:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y3dR3T2kzDqQr
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 01:34:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ca0pyV/M"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y3Y51D26zDqQr
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 01:30:31 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id q10so28203436pff.9
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4ZIObMawwtwioMp4FRxqXGuSeISDDgXDPeHRC+wv08o=;
 b=Ca0pyV/M/Cxvi5T5/TqaFjVSBy7paxemwQRUMlM4mAWHSI+Ujup5GDit7f4dogCw+A
 doPtmE+jLE1URvJePBkNL0LyEybgAv3G3/3E48RXse5jiiZRKgWHACHduI+hR4LktKQy
 CJfLQmT30oWdfG9bP0awsdr42UdsASomAZmigXCYzECjsxt5IMwntIJwbgpdqiyze096
 EKpp+fLTkB48x7GFvXBKwvBoA14lsq9Jrna4M+oU68h1KRr9PSZ/1apgW2USOk3+1fp/
 pKEnS+1/72rqN/3N2JA/tSsDVBc0r7aTJHEU/gwuQJWkd9HUvZBPpL7ssgsEXptXJkWh
 Pa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4ZIObMawwtwioMp4FRxqXGuSeISDDgXDPeHRC+wv08o=;
 b=TRWd4jctaI1npgkiHo2wH5ZPEjhQj8fKI0YLdjEeHliWT2hI7w0Z8ZaZJ9xHtzaAUq
 EXlTnurH5THcyvJwwltRKS+ri/D9kVDeNztOFZRR0GApbmw1xVTuvx1MDavp8gisciPR
 K0beK98tSCdDXK+0qLs5/iQthvVuTt1Hlr7b3mU81PDJAMkM1nyv+cz4I418DpVf/4/0
 Vx/SJKnWcVHxTR26k/Z+dB9v9EnoBXUmwF+EXy96qgSlBv2dMT2FHovurTHTOMi8+QGC
 P+L1l7X7dlHCYPXvo3b6EhC+Ed54aPXnA8WK0oFTdvzkznBOSCFRKkdJSub62HLPV6KS
 Omhw==
X-Gm-Message-State: APjAAAVIQ3ckWs+VI0VZbYUBt83azdkhrEUY1NTS13HbiefYdhEceC6J
 pSIjpWliV96jXXJbXMwcwqo6VdfHjkNtdXB+ivFfBA==
X-Google-Smtp-Source: APXvYqzRd2YhPoxZb3nDw21JEeJkBH0JFNcz/K2tDt6FZDBO2eSBkrR+yb6+GKN8avpeCSODEYhGuoiFoiE/ied6aXk=
X-Received: by 2002:aa7:9f1c:: with SMTP id g28mr36789825pfr.81.1564414226924; 
 Mon, 29 Jul 2019 08:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <5a7988638ddf428cb8267d7e339cdbcf@lenovo.com>
 <CAO=notyiSd+kcHD_ed7CtLY8G-+fvWt9fgXbQARS9nq7PGXXnQ@mail.gmail.com>
 <a190291d8f454efbbb17b95e28085466@lenovo.com>
 <2b4006da-752e-fa9b-8500-431c5b42d00f@linux.intel.com>
 <baa7b1f21ad34c35841004c5224309ff@lenovo.com>
In-Reply-To: <baa7b1f21ad34c35841004c5224309ff@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Jul 2019 08:30:15 -0700
Message-ID: <CAO=notyH-R0HV-8ff28phvtdq-hhGpT9W81aApUg7xUF7VUopw@mail.gmail.com>
Subject: Re: [External] Re: Questions regarding of phosphor-pid-control
To: Derek Lin23 <dlin23@lenovo.com>
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
Cc: Duke KH Du <dukh@lenovo.com>, Andrew MS1 Peng <pengms1@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Harry Sung1 <hsung1@lenovo.com>,
 Xiaohan XH6 Xu <xuxh6@lenovo.com>, James Feist <james.feist@linux.intel.com>,
 Haitao HT11 Wang <wanght11@lenovo.com>, Yonghui YH21 Liu <liuyh21@lenovo.com>,
 Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2019 at 2:18 AM Derek Lin23 <dlin23@lenovo.com> wrote:
>
> Hi Patrick & James:
>
>         Would you please identify when'll this feature being completed?
>         Or do you have a plan for this feature?
>
>         https://github.com/openbmc/phosphor-pid-control/issues/2

I currently don't have it on my calendar.  James, do you?

for a non-dbus-configured system, we end up using waits in the service
file for the various sensors upon which we depend to show up on dbus.
IIRC< the goal of the feature would be to no longer need that, but
rather create the dbus sensors even if nobody owns them, and just try
on read or every few reads to actually register the listening for
updates...  And just return a bad sensor reading until that happens --
but, what is a bad sensor reading, universally?

>
> Thanks,
>
> Derek
>
> -----Original Message-----
> From: James Feist <james.feist@linux.intel.com>
> Sent: Friday, July 19, 2019 1:57 AM
> To: Derek Lin23 <dlin23@lenovo.com>; Patrick Venture <venture@google.com>
> Cc: Yonghui YH21 Liu <liuyh21@lenovo.com>; Harry Sung1 <hsung1@lenovo.com=
>; OpenBMC Maillist <openbmc@lists.ozlabs.org>; Andrew MS1 Peng <pengms1@le=
novo.com>; Lisa YJ19 Liu <liuyj19@lenovo.com>; Haitao HT11 Wang <wanght11@l=
enovo.com>; Xiaohan XH6 Xu <xuxh6@lenovo.com>
> Subject: Re: [External] Re: Questions regarding of phosphor-pid-control
>
> On 7/17/19 7:40 PM, Derek Lin23 wrote:
> > Hi Patrick:
> >
> >            The open-loop in this context is more likely to set duty of
> > PWM manually.
> >
> >            For example, when reading a sensor above or below a certain
> > pre-defined temperature, then the duty of a PWM is revved up or lower
> > to the desired fan-speed.
>
> You could use stepwise configurations to get this response. Here's an exa=
mple of a lower clipping curve that when the reading of the sensor is 20, o=
utputs 50%, and when it reads 30 outputs 60%.
>
> https://github.com/openbmc/entity-manager/blob/9813279b57359bd1602da236ff=
7d38bcc9a2fba4/configurations/R2000%20Chassis.json#L428
>
> This is also configurable from the json I believe.
>
>
> >
> >            More likely, PWM is set simply by the reading of a
> > temperature sensor. A map of temperature readings and PWM values can
> > be represented as an example.
> >
> > Thank you,
> >
> > Derek
> >
> > *From:*Patrick Venture <venture@google.com>
> > *Sent:* Tuesday, July 16, 2019 1:02 AM
> > *To:* Derek Lin23 <dlin23@lenovo.com>; James Feist
> > <james.feist@linux.intel.com>
> > *Cc:* Yonghui YH21 Liu <liuyh21@lenovo.com>; Harry Sung1
> > <hsung1@lenovo.com>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > *Subject:* [External] Re: Questions regarding of phosphor-pid-control
> >
> > On Tue, Jul 9, 2019 at 2:03 AM Derek Lin23 <dlin23@lenovo.com
> > <mailto:dlin23@lenovo.com>> wrote:
> >
> >     Hi Patrick:
> >
> > Adding the openbmc mailing list.  Please always include this mailing
> > list in your emails for archiving and later reference as well as
> > opening up the question to others.
> >
> > Also adding James Feist as he co-maintains this codebase.
> >
> >                This is Derek from Lenovo BMC team.
> >
> >                We have some questions regarding ofphosphos-pid-control
> >     <https://github.com/openbmc/phosphor-pid-control>, and we hope you
> >     can provide some advice of the component.
> >
> >                Currently, we would like to import phosphor-pid-control
> >     as our thermal fan control module. After a brief study, we would
> >     like to know if phosphor-pid-control can support open-loop and
> >     event-triggered events?
> >
> > I don't really know what open-loop means in this context.  Registering
> > for events, like?
> >
> >     Thank you for your feedbacks,
> >
> >     Derek
> >
> >
> > ----------------------------------------------------------------------
> > --
> >
> >     *Derek Lin*
> >     Sr. BMC Engineer
> >     8F,66, San Chong Rd., Nankang Software Park, Taipei.
> >     Lenovo Taiwan
> >
> >
> >
> >     Phone+886281707411
> >     Emaildlin23@lenovo.com <mailto:dlin23@lenovo.com>
> >
> >
> >
> >     Lenovo.com <http://www.lenovo.com/>
> >     Twitter <http://twitter.com/lenovo> | Instagram
> >     <https://instagram.com/lenovo> | Facebook
> >     <http://www.facebook.com/lenovo> | Linkedin
> >     <http://www.linkedin.com/company/lenovo> | YouTube
> >     <http://www.youtube.com/lenovovision> | Privacy
> >     <https://www.lenovo.com/gb/en/privacy-selector/>
> >
> >
> >
> >     ImageLogo-DCG-Honeycomb
> >
> >
> >
