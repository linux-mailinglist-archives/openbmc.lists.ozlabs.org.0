Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B02BD2550C0
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 23:50:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcxHR6dSQzDqk8
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 07:50:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c2e;
 helo=mail-oo1-xc2e.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PbCUmMD4; dkim-atps=neutral
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcxGc5PT5zDqk8
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 07:49:57 +1000 (AEST)
Received: by mail-oo1-xc2e.google.com with SMTP id m4so1578534oos.6
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 14:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/91ofdiqY8i82ze4RCLLxQAurAunVWLghlNPzAXS/+Y=;
 b=PbCUmMD410PlsLcoA9yVN4vPOaLVr+F5Ie96vV6o7A/HB5LQzDrt6phtchxdgQ92N3
 YvcWiruoAq8AKIpLUV7cn3r8wkPDBViWs5iPYk37FKcBq6D29DQ+rC1Af2whXQ4lyehA
 MSCpmoVklQW2B4pRdt6YlXJRwImr1BVGBnsGCNfTos68yrorj9S+4rPGBBhD5DKRi2RZ
 du5Dcis+DmSzPiH5jx0U9JTHHHwuSxTrPoQzhn27p3iJX6TAhaMSvCh8xHxF9A5Q3JDA
 f/5I3FRE+RM92Xasr/k1O54ipmLb/uEaD/ijq8L1wmmGMil7ZxD8MJuKQfd5cx9mDAMs
 yrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/91ofdiqY8i82ze4RCLLxQAurAunVWLghlNPzAXS/+Y=;
 b=UORZHIsVQJAjChj+W3JDEC+vq3SEdpUHJznFzoDJgFjhQHx+XDVDaYeqETQCApFdrd
 e+NmxF9OW7J8CB2tpfkuZdbpR4BDXgkdirIP2CtFGIeAdOVjbDhtzwvXnT/XRO10JVHi
 Ul/0DlrVpp8QYGO1ve0dimPqgR/U+oxD24xOL7Hj5zs+8gnMMNBzRPFt8UkTgx8TU/XY
 91AoUgij7NX1hBROqHsTwgP+d3PIaKBjdNxAesfrZ8VoXG5aOAKpa4d7w7FiRlsmNgit
 WYLSLYUGKUVhe2NxLdDernFJueIs9F48ngBd6xxM8GSOX7P7KGBOk/mAVtdoVgAaVPXT
 GCRA==
X-Gm-Message-State: AOAM531C5+Oex62ws51iAR3737TjrlstdkMTuYBFRZs2NPWW1+Num7Bq
 ZbBIfCjZqaXVQISLjDwY6syAKwjlUv/6fQq15PUOgg==
X-Google-Smtp-Source: ABdhPJweSmj1lOBPz1BhtRzMeYd4Kf2ooGoCGABciFvJL1dG6i88aFPiNaVNcd8d45TQZZVo9tWUhj0n0P4sJir5ZvY=
X-Received: by 2002:a4a:c887:: with SMTP id t7mr15700213ooq.57.1598564993918; 
 Thu, 27 Aug 2020 14:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
In-Reply-To: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Thu, 27 Aug 2020 14:49:42 -0700
Message-ID: <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009d426005ade2ea75"
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
Cc: Peter Lundgren <peterlundgren@google.com>, Josh Lehan <krellan@google.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009d426005ade2ea75
Content-Type: text/plain; charset="UTF-8"

Hi James,

After some debugging, I realized that the code I pointed out earlier wasn't
the root cause. Update is that, the HwmonTempSensor stops updating after
the hwmon driver returns EAGAIN as errno. I'll keep debugging...

- Alex Qiu


On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu <xqiu@google.com> wrote:

> Hi James and OpenBMC community,
>
> We have a sensor for HwmonTempSensor which doesn't have a valid reading
> until the host is fully booted. Before it's becoming alive and useful, it's
> getting disabled in code (
> https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266)
> because of errors thrown up by the hwmon driver. Ideally, the thermal
> control loop should kick the fan to fail safe mode until no more errors are
> observed.
>
> Any suggestions on how we should handle this kind of sensor properly?
>
> Thank you!
>
> - Alex Qiu
>

--0000000000009d426005ade2ea75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi James,</div><div><br></div><div>After some debuggi=
ng, I realized that the code I pointed out earlier wasn&#39;t the root caus=
e. Update is that, the HwmonTempSensor stops updating after the hwmon drive=
r returns EAGAIN as errno. I&#39;ll keep debugging...</div><br clear=3D"all=
"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr">- Alex Qiu</div></div></div><br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 25, =
2020 at 5:49 PM Alex Qiu &lt;<a href=3D"mailto:xqiu@google.com">xqiu@google=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>Hi James and OpenBMC community,</div><div><br></d=
iv><div>We have a sensor for HwmonTempSensor which doesn&#39;t have a valid=
 reading until the host is fully booted. Before it&#39;s becoming alive and=
 useful, it&#39;s getting disabled in code (<a href=3D"https://github.com/o=
penbmc/dbus-sensors/blob/master/include/sensor.hpp#L266" target=3D"_blank">=
https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266=
</a>) because of errors thrown up by the hwmon driver. Ideally, the thermal=
 control loop should kick the fan to fail safe mode until no more=C2=A0erro=
rs are observed.</div><div><br></div><div>Any suggestions on how we should =
handle this kind of sensor properly?<br></div><div><br></div><div>Thank you=
!</div><br clear=3D"all"><div><div dir=3D"ltr"><div dir=3D"ltr">- Alex Qiu<=
/div></div></div></div>
</blockquote></div>

--0000000000009d426005ade2ea75--
