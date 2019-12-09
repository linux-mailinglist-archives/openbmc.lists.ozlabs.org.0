Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5B117814
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 22:11:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wwpl1HwgzDqSr
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 08:11:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2e;
 helo=mail-io1-xd2e.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rXrQO4pc"; 
 dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wwnk4kpDzDqQg
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 08:10:16 +1100 (AEDT)
Received: by mail-io1-xd2e.google.com with SMTP id i11so16340822ioi.12
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 13:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=spZ8fM3HaKQ7pTWlOStME5G5p1n7XEHqtL28l8WYzF4=;
 b=rXrQO4pcGRJ0p129lElCR8w5rSQBacZEx1k4/qpMwmOxzX9RJyL6SH73t4l3FXBNOH
 Oe2dYFSjIvwgkUXZrs3wmINKcwiV2yNrp9razmPacaJiD2prQMo01SIQbBWcixFjRc92
 huMmpopzsOg8fKS856wzBRzyUPURR4O6EpCL/baEdnTXEKicM2ywvHsJa12Zp1JtxQQ6
 Dwdu6Ux7fRE64kNiBuYyXiuJjb/WaJCcGQSD1Yz7dMnPr+TGGF83qLTNYSv0uZrjXdiQ
 ValQHI0jIBfHAOilQFYyLE4+c3+YWw0CuycXQatbES5Wuut881Duuynl9UHNuvCKvD/g
 JEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=spZ8fM3HaKQ7pTWlOStME5G5p1n7XEHqtL28l8WYzF4=;
 b=dspMugbUd7VbmJIRy8g2g3MKjFxZMXxwasWrcaLTcF3buL0HUryh94SVBHV67h2sfP
 glVtEDABSURDECzGrnteHKhgF6WQTRfhTBt/0CTbFMIiezZa6KNY6TCXKWEtQOHTaZLg
 nKi637hRFfQPVR+5J/8p6zzPNXUGvSvnJP/9eoMrrgI1fky8/p3oJZNv+7I3qDUs7K9+
 MZ1XvralwWWCGizWJTTgu1QWeHXdkSiNcXxbmpTc3c8ZEgQz9T8gE+R6/YxlL0iuJzit
 yTS/EY3SuZ63/wl1tjRB8ds3hChJdDgdxSlXtNu9FGLSiLxjKxJmFs3wyYDrPfwecan8
 6K0Q==
X-Gm-Message-State: APjAAAX6xfXhNee5LIuoozyINn6FZs5TlorW26jVSgvUCwAzOCnYXHem
 cO30pPbq2vXzG7tAHreDjHVj7K09Hz6UaglcNfM4jA==
X-Google-Smtp-Source: APXvYqyvPZEh31I3UZSVPF0HzrS62QxXPLK+huEN6uotrN1oDtV10Nx16Fsn821iSWviIuoU1HTU0GWpePazgB+pZTk=
X-Received: by 2002:a6b:fb19:: with SMTP id h25mr22835930iog.40.1575925812613; 
 Mon, 09 Dec 2019 13:10:12 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmNsry0bq-5eTD5qo0LDq_zWag9s8kGqMq4yGxzpxXCeA@mail.gmail.com>
In-Reply-To: <CAARXrtmNsry0bq-5eTD5qo0LDq_zWag9s8kGqMq4yGxzpxXCeA@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 9 Dec 2019 13:09:46 -0800
Message-ID: <CAGMNF6Wc_1pxReDXYQvOQO1Oy5K+Ejn+G+j9F-ei4Vpg4nQ5XQ@mail.gmail.com>
Subject: Re: Updates and future changes on phosphor-power
To: Lei YU <mine260309@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000041ac5305994bd246"
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

--00000000000041ac5305994bd246
Content-Type: text/plain; charset="UTF-8"

Hello Lei,

We have some interest to help contribute to the phosphor-power utils. Just
have some simple questions. Sorry if they have already been asked!

On Tue, Oct 22, 2019 at 2:49 AM Lei YU <mine260309@gmail.com> wrote:

> This email is to introduce the current status and future changes of
> phosphor-power.
>
> ## Background
> Previously, [witherspoon-pfault-analysis][1] exists for Witherspoon to
> provide functions like PSU monitor.
> Later it's found that the code could be shared for other PSUs as long
> as a property json config is provided.
> So the repo is renamed to [phosphor-power][2]
>
> ## Status
> Now the repo is renamed and I am adding the bitbake recipes into
> meta-phosphor, see
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/26356
>
> However, the repo still contains something that is not generic:
> * There is repo specific error defined in org/open_power/Witherspoon/
> * It has a dependency to openpower-dbus-interfaces to use interfaces
> in org/open_power/Sensor/Aggregation/History
>
> That is not ideal.
>
> ## TODO
> The repo specific error and the interfaces in
> org/open_power/Sensor/Aggregation/History are actual generic, so they
> could be moved into phosphor-dbus-interfaces to become generic
> interfaces.
>
> So I am planning to "copy" the above interfaces into
> phosphor-dbus-interfaces, and when it's done, update this repo to use
> the interfaces in phosphor-dbus-interfaces.
>
> Do you have any comments or suggestions?
> Thanks!
>
> [1]: https://github.com/openbmc/witherspoon-pfault-analysis
> [2]: https://github.com/openbmc/phosphor-power
>

Will phosphor-power provide PMBus fault status bits monitoring? How is it
co-operating with phosphor-hwmon or dbus-sensors when reading sensor data
from the same PSU device over the same i2c bus?

-- 
Regards,
Kun

--00000000000041ac5305994bd246
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Lei,</div><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">We have some interest to help contribute to the phosphor=
-power utils. Just have some simple questions. Sorry if they have already b=
een asked!<br><div><br></div></div><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Oct 22, 2019 at 2:49 AM Lei YU &lt;<a href=
=3D"mailto:mine260309@gmail.com">mine260309@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">This email is to intro=
duce the current status and future changes of<br>
phosphor-power.<br>
<br>
## Background<br>
Previously, [witherspoon-pfault-analysis][1] exists for Witherspoon to<br>
provide functions like PSU monitor.<br>
Later it&#39;s found that the code could be shared for other PSUs as long<b=
r>
as a property json config is provided.<br>
So the repo is renamed to [phosphor-power][2]<br>
<br>
## Status<br>
Now the repo is renamed and I am adding the bitbake recipes into<br>
meta-phosphor, see<br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/263=
56" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz=
/c/openbmc/meta-phosphor/+/26356</a><br>
<br>
However, the repo still contains something that is not generic:<br>
* There is repo specific error defined in org/open_power/Witherspoon/<br>
* It has a dependency to openpower-dbus-interfaces to use interfaces<br>
in org/open_power/Sensor/Aggregation/History<br>
<br>
That is not ideal.<br>
<br>
## TODO<br>
The repo specific error and the interfaces in<br>
org/open_power/Sensor/Aggregation/History are actual generic, so they<br>
could be moved into phosphor-dbus-interfaces to become generic<br>
interfaces.<br>
<br>
So I am planning to &quot;copy&quot; the above interfaces into<br>
phosphor-dbus-interfaces, and when it&#39;s done, update this repo to use<b=
r>
the interfaces in phosphor-dbus-interfaces.<br>
<br>
Do you have any comments or suggestions?<br>
Thanks!<br>
<br>
[1]: <a href=3D"https://github.com/openbmc/witherspoon-pfault-analysis" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/witherspoon-pf=
ault-analysis</a><br>
[2]: <a href=3D"https://github.com/openbmc/phosphor-power" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/openbmc/phosphor-power</a><br>
</blockquote></div><div><br></div>Will phosphor-power provide PMBus fault s=
tatus bits monitoring? How is it co-operating with phosphor-hwmon or dbus-s=
ensors when reading sensor data from the same PSU device over the same i2c =
bus?<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></div></div>

--00000000000041ac5305994bd246--
