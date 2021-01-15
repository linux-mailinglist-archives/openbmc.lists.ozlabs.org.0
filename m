Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430E2F72AA
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 07:00:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH9XF2dHBzDsb7
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 17:00:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=jUbQdeP7; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH9W84vKDzDqvR
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 16:59:46 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id q25so7550700otn.10
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 21:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZQ8qDXGuoTuhGB326hLy+YCuIOJen/RXku/DQkytrQI=;
 b=jUbQdeP76RWUsjuVyE1a2K8he2+Q9TNX2xHYsw3nw+hmg72Dr0yO7fPQEcm1tMg0zK
 QV6uYx3EMmbT7pTbLop1NKIldltBRoUhQfQ1kcmheJwNci7tyyNjhiOL8SHmpLVoaKZG
 iNb9PCmlq/yhJtPLc1JUSsmLVg6Tnd/QWyYXQa/fj89d4T/SabV3Y88BcZ9VBBvKp8br
 1MxosIPp9lhnsp+HqlsglGRkNTkDkPDqUBtNLu6oj5XapzHNw386RZ42GJ10IQ4aF1KN
 tU83xT6bdSy92luR9kwBFrO0s0gk52Dy2DmpgizekvQkq9SskOJFfCNiYY4mq+Koy2gx
 LkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZQ8qDXGuoTuhGB326hLy+YCuIOJen/RXku/DQkytrQI=;
 b=gFU77nbVmVTm2lEmCt14E7LSZOCYp43+vICyKoy20YJFGL6bSRObs5M+3o96wTO+rI
 /Phuc3Oi7VdbmsPXcJFzvhlBRIusfZJK3pw+yNiBAbOEw7MgN2q8a2qeruOFVuHYPXzL
 y2MqgVLcIpv2KnCX1wzmszmKSr1X60JtVkvO31u+GM1w0VKfFDf4aSZZQ3vF5aAQFqY0
 zkmDyMngxecB50euszyIM722KgxfGEUC3a7p6Ygc1/NEf4LQioc2mnVBKf5FRUQgUsmo
 boNJmbGAd6UM/W0Q5Xm/E+ig9d+Wz+Z3fqfyMiAeBYvtXzNphONQClYQNRgbUvw+03jf
 l1HA==
X-Gm-Message-State: AOAM530VviJNtvv4HhZEzUquReuXE7nL4bh6WFU+etX0EUPQ+yJ7dOzA
 9qCQSvQOUCbJr4v8P80vuJ8kUq5kq5U7HoQRf+b+Tw==
X-Google-Smtp-Source: ABdhPJzc5g6QFXpsWOww6itJL+EEmZM26aAWPzps9+aBQLyzIKWEfmX/oKdlLfzMVbI6LNH4ZO9LlP6IbHeIrEGiSsc=
X-Received: by 2002:a05:6830:1be9:: with SMTP id
 k9mr7196525otb.226.1610690382933; 
 Thu, 14 Jan 2021 21:59:42 -0800 (PST)
MIME-Version: 1.0
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
 <20210114173805.GB45289@mauery.jf.intel.com>
 <CAGm54UGtnHK+MsNCbaWSOCxUtoTzOJddn+1h5DKUZy5sPEmm=w@mail.gmail.com>
 <6001181A.3090500@linux.intel.com>
In-Reply-To: <6001181A.3090500@linux.intel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 15 Jan 2021 13:59:31 +0800
Message-ID: <CAGm54UGNi+mRjBA6EvFZHEgnRink7LGue96cYq5SvPwc+U=SXQ@mail.gmail.com>
Subject: Re: Intel-ipmi-oem repo
To: "chunhui.jia" <chunhui.jia@linux.intel.com>
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
Cc: Willy Tu <wltu@google.com>, Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "apparao.puli" <apparao.puli@linux.intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 15, 2021 at 12:20 PM chunhui.jia
<chunhui.jia@linux.intel.com> wrote:
>
> You use both fixed sensor and dynamic sensors?

Not exactly.
We use "dynamic sensors" created by entity-manager/dbus-sensors on DBus;
We use "fixed sensors" with phosphor-host-ipmid defined in yaml.

>
> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9ALei Yu <yulei.sh@bytedance.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A2021-01-15 10:23
> =E4=B8=BB=E9=A2=98=EF=BC=9ARe: Intel-ipmi-oem repo
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A"Vernon Mauery"<vernon.mauery@linux.i=
ntel.com>
> =E6=8A=84=E9=80=81=EF=BC=9A"Willy Tu"<wltu@google.com>,"OpenBMC Maillist"=
<openbmc@lists.ozlabs.org>,"chunhui.jia"<chunhui.jia@linux.intel.com>,"Ed T=
anous"<edtanous@google.com>,"Brad Bishop"<bradleyb@fuzziesquirrel.com>,"app=
arao.puli"<apparao.puli@linux.intel.com>,"Vijay Khemka"<vijaykhemka@fb.com>
>
> On Fri, Jan 15, 2021 at 3:23 AM Vernon Mauery
> <vernon.mauery@linux.intel.com> wrote:
> > I would say that if IBM is the only company using the sensor
> > implementation that is currently in ipmid, it would be best to move it
> > to the IBM OEM layer. But it is difficult in a project this size who is
> > using what. So leaving it in ipmid for now is fine.
> >
>
> This is not the case. Bytedance uses ipmid with fixed yaml as well.
> In our case, we have all the sensors on DBus created by
> entity-manager/dbus-sensors, and only part of them are necessary for
> ipmi.
> So we specifically define the necessary sensors (and
> inventory-sensors) in yaml and use the current ipmid to implement
> them.
>
> AFAIK Yadro and Ampere uses ipmid with fixed yaml too.
>
> --
> BRs,
> Lei YU



--=20
BRs,
Lei YU
