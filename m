Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 716263BB6A8
	for <lists+openbmc@lfdr.de>; Mon,  5 Jul 2021 07:09:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJDJS3J6Xz30B7
	for <lists+openbmc@lfdr.de>; Mon,  5 Jul 2021 15:09:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=AcJ7ADYX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=AcJ7ADYX; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJDJ912ymz2yxS
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jul 2021 15:09:26 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id h9so19505608oih.4
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jul 2021 22:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=agtofjjE58hVaO8+IG74IMsPmMtpw1eKqJLlXQUovnM=;
 b=AcJ7ADYXRex7H6YyaaKWcjMkEyxKm/RhtTqASKDHDeP9Mqhf4zp0Ule3OocGfkMO0Q
 UtRrfml+3sOq71tzfFRD4OMYaEfcOfkT5xd3Wka9vXJu2s3sxBlt+x2PBrVdPma1wNxO
 LvjGZs/HO3aZyK77YUR6ahY34F0y0ZgHeGC3cMKSjIZr2JS62d5rF1sZY6QO39PiDO1C
 KaVkzVdNLXhy2D9GE1833MKcFzLzKOjEl2ql6MyLol2O2xzwdzaGtVY0/Sr75MHj4Uwn
 EoQKAOu705j8a1nLWMuacmtQD/P+7ef/RTHkJfnuBaaKuUlUU4hpZI4DMC2r1CGpQ6g9
 g0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=agtofjjE58hVaO8+IG74IMsPmMtpw1eKqJLlXQUovnM=;
 b=fQqF5yeOL1E/RFy9RPhoacStAW+ziajXXtMYdsuQIEvexh2U0ozGkGwMQTLSc4gurX
 I1PUXmhUXgtN20KJSMp5eVAyXHyN25usFmlNr0Q/Dw7Tufib3jYplHJRRWqvwFm8NRQH
 2vpP1iLE5emz4klr3aAPAOHjcNJZFHVBDd0DRnJMN3Z1SYx2c2/LYF4ncjYRU9Yrq4Vy
 nZ9rmdsrPbgRQqtGhl123Rgp9jMsWRZvXCVojL2O/N4dktGgKaUsVuCh78QmqJB55jeN
 kwb7/17qPs99BmhQvoK0iZJJce0dej1eiCnj7iZ69vCfUg6nP8jugUrVTzT42CKWiLOq
 M41A==
X-Gm-Message-State: AOAM531w4WfgKLtcaTqmgyVxq+vy224NYiDgrJa6rL2fj07c1Jz7ycDY
 2DO50w/eGMkTEWHT6GSXWGR1eZ6SD8o/Wir7dM3S2t+PRl98Sg==
X-Google-Smtp-Source: ABdhPJzYVXt5lKcBvzFWCR0KUPDmCk0jnd7y2BcWZ0FT4FinzlMhy//sROENDR95UszQnCwVdDLKbpVSS3Bb9eSKSKo=
X-Received: by 2002:aca:1809:: with SMTP id h9mr9150171oih.4.1625461761982;
 Sun, 04 Jul 2021 22:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR11MB4443717C492EB29501AA90CF97009@DM6PR11MB4443.namprd11.prod.outlook.com>
 <CAGm54UFGsDWi+rukJAZTELFZQfEovdv5yLj9W9TGavi2AiAuDw@mail.gmail.com>
In-Reply-To: <CAGm54UFGsDWi+rukJAZTELFZQfEovdv5yLj9W9TGavi2AiAuDw@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 5 Jul 2021 13:09:11 +0800
Message-ID: <CAGm54UGWM=2nGNFCnEOrKrkSwevdKwZBn6Pnn2OgRDDYW76gMw@mail.gmail.com>
Subject: Fwd: [External] consult OBMC SEL log solution
To: openbmc <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jenny,

I am copying this email to the openbmc mailing list so the community
knows the discussion.

On Thu, Jul 1, 2021 at 4:50 PM Chen, Jenny <jenny.chen@intel.com> wrote:
>
> Hi Lei,
>
>
>
> This is Jenny from Intel BMC, I saw you have some refine for IPMI SEL log=
, and could you kindly help answer my questions to help me know more IPMI S=
EL logs? Thanks in advance!
>
>
>
> I saw you added =E2=80=9CSEL_LOGGER_SEND_TO_LOGGING_SERVICE=E2=80=9D to c=
ontrol use which solution:
>
> a. The logging entry on Dbus
>
> b. The ipmi_sel log stored in "/var/log/ipmi_sel"
>
>
>
> Questions:
>
> Currently seems defaue use the b(log files) solutions. Can I know whether=
 there is issues found and we translate to use a solutions?
> What=E2=80=99s currently status of solution a implementation?

The way to store "/var/log/ipmi_sel" has some issues:
1. The upstream ipmid does not support parsing this file. The
implementation is in https://github.com/openbmc/intel-ipmi-oem.
2. If the user uses intel-ipmi-oem to support the ipmi_sel log, it
introduces many other ipmi commands that are likely not needed.
3. It separates the ipmi_sel and redfish event logs. E.g. in Intel's
implementation, an SEL sent from BIOS to BMC is stored as redfish
event log in "/var/log/redfish", and no ipmi sel is created.

The way I proposed[1] could solve the above issues:
1. The upstream ipmid already supports parsing the log entries;
2. No intel-ipmi-oem is needed.
3. The log could be represented as ipmi sel or redfish event logs
(with -Dredfish-dbus-log=3Denabled)

[1]: https://lore.kernel.org/openbmc/CAGm54UHdTyPh0hGiatA44whg2PdRzJFg0gBnV=
HA4moYRr=3DaT=3Dg@mail.gmail.com/


--
BRs,
Lei YU


--=20
BRs,
Lei YU
