Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1FEBC23
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 03:59:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746P62zwvzF6V8
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 13:59:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FvqjESvx"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746Ls2pzJzF6SV
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 13:57:56 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id s17so9346521iol.12
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 19:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vl9DYZVbURheTw9kyAQnOgnawHOqGrg1G6Bfw1S1Wk0=;
 b=FvqjESvxa4yJwWNE2zOZWIytsVlGM01TgJe6zyz9nXFEec3oR2B8Z16bta9xECILdy
 GePU8DSbQcJ/WnLFDqwp0JJBuQNB7RjI5kyVKX0+p3ILFbYYFC1xeS0e9pgu4nKXA4L3
 lNF82WaVeGjz4e7aR2mQ2be7/nCFtgs8gsiq0Da5JDQx6HaXyzCA4YVLKTzjdQSeyNPV
 rEXMDRWbQeC9pLxtInhl9WF7sXrvuM9qAoBO/k0kW3RndeZdAgFBQ2PuPXtNsOaJ2tsx
 WIm2q3nSvDDDZq/aH5bsrBNOIusv2fWUVDZ0SJqOvV+zNjeSl7iURy6Qa82o3wKmDgTZ
 vDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vl9DYZVbURheTw9kyAQnOgnawHOqGrg1G6Bfw1S1Wk0=;
 b=gyf9xY8+3Ei0fWdqjBjPeJhN5sB6FrJjR9i2pRq3JRt5w5vUSh+v0upE2V7TAXnl5Z
 nOjtQ09EuOmMphicXVaXDdyo3purfDNv8fZ08plAibxuaEqyXiK0UqBg9CsgpoDPO8ed
 4HEwaPR12ZJttMn/LNJi7rzaOAjgtknKQE8M7kpBbowxz0HOzz0KSuFfrLJnNgLYF3B7
 rk3QxmL4JVb0wWABMdJnVU04P55ljYsD3GuiYkFYHS7s9tKUol5QsmXh8tCLVRQskbZb
 54o9wLa7YZxrQYNMpqbvPFO3R2R3lZlUHRFHSOh3kHoST4dGpQ6LlsxuVG6sW6xu6wh0
 WnYg==
X-Gm-Message-State: APjAAAVIw1801ijN74CpFzCFDBy4j8V6HPJod4kIU3pJ6OskKUUZod/S
 ffmIgA2R6U+RBseDxT/wJuhVUMSuzpxGYfCTEHE=
X-Google-Smtp-Source: APXvYqyMiTHMUBkV5wvSWaAJlj6fR9ACkF29Va66VdoPcnda+iGA0B92lq5HmLrMhVN61OKkbu3q82WHqri+GnGg8sQ=
X-Received: by 2002:a5e:9e07:: with SMTP id i7mr6720052ioq.42.1572577073017;
 Thu, 31 Oct 2019 19:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <fed4bf71fdbf452f955f527b20c36c08@lenovo.com>
 <CAO=notyoynBRNHg9fgPX1QgJ_kghX_=uKbeJ+CCmsv5mPubNKg@mail.gmail.com>
In-Reply-To: <CAO=notyoynBRNHg9fgPX1QgJ_kghX_=uKbeJ+CCmsv5mPubNKg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 1 Nov 2019 10:57:42 +0800
Message-ID: <CAARXrtkEPRj+CwPr032-D5nmh_q=c_sRz6kUNu5To=LjZzS9zA@mail.gmail.com>
Subject: Re: FanPwm interface
To: Patrick Venture <venture@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Derek Lin23 <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 1, 2019 at 6:32 AM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Oct 31, 2019 at 3:27 PM Derek Lin23 <dlin23@lenovo.com> wrote:
> >
> > Hi team:
> >
> >
> >
> >           I have a question regarding of FanPwm interface on hwmon.
> >
> >           Does this interface get updated while PWM is changing in sysf=
s?
> >
> >           For example, if I setup a fan points to a PWM like below conf=
iguration, now, FanPwm interface does not get updated when I update PWM in =
sysfs, only my fan inputs (rpms) do.
> >
> >
> >
> >           Example:
> >
> >           LABEL_fan1 =3D "FAN0_Speed"
> >
> >           =E2=80=A6
> >
> >           PWM_TARGET_fan1 =3D "1"
> >
> >
> >
> >           Is there a configuration or label which I can use so FanPwm i=
nterface would get updated when I change PWM in sysfs?
>
> Unless I'm mistaken, it's currently treated only as a Target -- so
> it's updated only via dbus calls to set it.

Exactly, it will not update if you change it directly in sysfs.
This is OK in field because a regular user should access the BMC via
Redfish/REST API/ipmi.

But for debugging purpose it does have some trouble that updating pwm
in sysfs does not reflact on D-Bus.
So patches are welcome :)
