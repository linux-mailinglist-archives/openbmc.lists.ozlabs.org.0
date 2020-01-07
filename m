Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5B131DE8
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 04:21:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sHhd2L5hzDqHZ
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 14:21:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F5imDyZh"; 
 dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sHgw4ntBzDqHY
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 14:20:24 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 15so37825663lfr.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 19:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LCHNYa6M3KrUlZcNIijIBnvB6jgid8VGDkKEDlYDZs=;
 b=F5imDyZh964DtXP8hSeGaK1YL93eMTdZeArsKe1V5RQn+XNw5y4WN7VdenWOo/aoJ5
 ZjFzpNBaMrqMaqqCceajEb9rjuAjxUez3amnSBvYNccBo3lArlcDxbWnJeJZoNaXE+OQ
 oXtf/PaMKD5v/ay4vxG3n03/mX++NE5yBopQmDh4YFtR1xkrMb1whQawDk/jP/JBM4q8
 RlFHpFlMIz6X8YwZWOKxXR0KBFk/7vvbpk6u3yYXQNjtu0jJX69G+2Ua6XRSORDuML0/
 25mv/WXATamHcQIP1oQ15eGuMqrH5b6+/UKjhJxZCNBIXkI8LqpNElFTTqN0X2mv6FL/
 031Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LCHNYa6M3KrUlZcNIijIBnvB6jgid8VGDkKEDlYDZs=;
 b=MbfBivcCVI+zzsCsMauProu9yX9PnMmwsmbQgQwXHXqdTpq/MjFC7+Q79Mr8k2NNMz
 wLZvO91nhrdTEBataYrhQoR6KmEnhN+jsg9Z1sAij2mo85515YY5WSSqq/q6MR88dri3
 vogoNUjsGakp4i4LspVD4LzcrEj04cYWfjreg6KTxMYO1G9YDQJ3m7n2uIezvqVMM6cz
 FHxs5n+AClr4qo1XFLmlmqy5e0umE5C02OMPkuBy8QU1FABpRO/tR7ejfZ+975S0XAIc
 06cxaaIbKZSu5tDifhyKMZQKq5+pWfDysmRTAdb/ao02LFTfHQjGPn9vZlFKtq4TsSmF
 ChTA==
X-Gm-Message-State: APjAAAVRHf1qOMrwSem8QOjBSQrpAHRCAC3mcWwi/NuL0BLw+iMgqtMe
 ebCjEEWDYFiweV0+nfSJlN3y60oGkglLegCO5Rg=
X-Google-Smtp-Source: APXvYqx7T3v0PbIA+gmpKusRZlI3Sna4N+xIpfhhjhn3do2Ct21lsctHP9ZtzXf1fQP8JOVzGB9Fh5+BgdHAM4RZ9v4=
X-Received: by 2002:ac2:485c:: with SMTP id 28mr57897460lfy.118.1578367217884; 
 Mon, 06 Jan 2020 19:20:17 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
 <e5878df7-b127-0f86-3366-722e94f86103@linux.intel.com>
 <CAA_a9x+wpvhD7pEe+TEqkjSb6ZoiiYz4ZZBQz0v_7V-cGywHXg@mail.gmail.com>
 <e585c0d1-81a8-fd09-cb43-84ac878568ad@linux.intel.com>
In-Reply-To: <e585c0d1-81a8-fd09-cb43-84ac878568ad@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 7 Jan 2020 11:20:07 +0800
Message-ID: <CAARXrt=C4nLhFc0kmgDY7rhjR5FfzFppJwGN7JxoHnKoNsvXag@mail.gmail.com>
Subject: Re: Configuring shunt_resistor in hwmon
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
Cc: Peter Lundgren <peterlundgren@google.com>, Alex Qiu <xqiu@google.com>,
 Kais Belgaied <belgaied@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Josh Lehan <krellan@google.com>,
 Devjit Gopalpur <devjitg@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 7, 2020 at 5:38 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 1/6/20 1:29 PM, Alex Qiu wrote:
> > Hi James,
> >
> > Thanks for your quick reply and reviewing my code in the morning!
> >
> > That looks interesting, so this ScaleFactor will be used to multiply the
> > voltage value from hwmon without setting the shunt_resistor explicitly?
> > I do have a little concern on the resolution, because it's only
> > reporting 0.165V with default shunt_resistor setting, but we'll try and
> > see if this will work for our case. In the meantime, do you know any
> > other method that will work?
>
> That's all I'm aware of in dbus-sensors. We have a voltage divider
> in-front of our ADC channels, so we use this scale factor to calculate
> the actual voltage. Anything else I think you'd need to add as a new
> change if you're using dbus-sensors. I'm not sure if phosphor-hwmon
> offers anything you could use or not.

With phosphor-hwmon, you could define GAIN, OFFSET in the config file
to adjust the reading.
See details in
https://github.com/openbmc/docs/blob/master/architecture/sensor-architecture.md#my-sensors-are-not-defined-in-an-mrw
