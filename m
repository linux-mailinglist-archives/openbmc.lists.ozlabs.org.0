Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA6E451A29
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 00:32:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtQSz0TzGz2yjS
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 10:32:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VAWFxsqp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=VAWFxsqp; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtQSb0qp5z2xBx
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 10:31:40 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id d5so33839555wrc.1
 for <openbmc@lists.ozlabs.org>; Mon, 15 Nov 2021 15:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QrycoOYyZ4WCJs9zryIQsbsTehh6WzIRsEG0If2ueuQ=;
 b=VAWFxsqpPo6fyW1ZI+uyUY2dF8zeozY+hDIzT5+mlNqROW1gFs48D0RB689M8563Mg
 S4r1JDJQPfICEiG4X3hfgfwBnXbsuXC4VqsQNbvKQVqrZKFJ0ErQfvmHR6tIvdGQ7WkS
 vem3xesdGgyCTwVjsqQMEI8vUT4RHh7IXjoqEpr+9Zq6ym+T01gMuifzu4LNTgKbwHy3
 zLIpFyjozzN3rGsjb/ICnyC4FgBMDOaI4KcUOatlH05TD+BQdqFeifHKCB6dav+CB5iC
 ZDkXwEIUmlqCfFgHbpue14J7O7SODS/0ZC6azdljQ39wIGq6QpZO1Rsb+O3sILc3Z6XW
 tlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QrycoOYyZ4WCJs9zryIQsbsTehh6WzIRsEG0If2ueuQ=;
 b=EQKBMu4ASa4/UwcaECqQlXQJfLMicddxJPE9F11Oqqk/KuKS5OWi7C3XRjzGoniI8P
 hnLJuZIguwI3yj1WkNkEYduhDnU/ltPZNdG1JQm5r/Fm6fWd0KyxsEiEVi2uhZSYLhrw
 THQbCh2UAQMY3vbpBfmcALk8gn4fxXG/89iIQHRhzowwlvq557NjpUPhjkSh3ZWHVITM
 2c5K6bBsAixfEwHRtgq+z1/9XklCcJDb5jgSgtD655VyfLtlONHHBkYM7pT4M9EKEFEA
 xYNdHbE/lS1BIUKyiKj18t+jweC5aJHTecNq62pcbI9soQTTATRa/2sJqf+ozDKpacPO
 p+qQ==
X-Gm-Message-State: AOAM530p+2NXQx8szGOV6aCFQ8UIK1CntE753oSImJ9RNFSa+WnzlqRO
 JhV6Dm0qvLHUyCEGzvsZ3x7dVz2LBnOOsVFhB36sVA==
X-Google-Smtp-Source: ABdhPJxzhaSacdS1GO4Em3T5JcbemPiYYM3xTr61SbkTNgINmBa0hsx85rYhu5QjDrOX2sNk4UHTmDeybLA5qU5xM6Y=
X-Received: by 2002:adf:ce03:: with SMTP id p3mr3658986wrn.145.1637019094972; 
 Mon, 15 Nov 2021 15:31:34 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR08MB40321BF3F391E7CFDEEBC2C4B6989@SN6PR08MB4032.namprd08.prod.outlook.com>
In-Reply-To: <SN6PR08MB40321BF3F391E7CFDEEBC2C4B6989@SN6PR08MB4032.namprd08.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 15 Nov 2021 15:31:23 -0800
Message-ID: <CAH2-KxCzp3WvMB855WPYU8_2_9DQE5jGvzD+ugso6fKAP1R2kQ@mail.gmail.com>
Subject: Re: phosphor-pid-control: PWM not changing back from Manual to Auto
 mode
To: Charles Boyer <Charles.Boyer@fii-usa.com>
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
Cc: "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "krellan@google.com" <krellan@google.com>,
 "vveerach@google.com" <vveerach@google.com>,
 Lancelot Kao <Lancelot.Kao@fii-usa.com>,
 Mustafa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 15, 2021 at 3:20 PM Charles Boyer <Charles.Boyer@fii-usa.com> w=
rote:
>
> Hello Josh and Ed,
>
> I used the OEM IPMI command to enter Manual mode of phosphor-pid-control,=
 and then I set the PWM value. After leaving Manual mode, I would expect sw=
ampd to bring the PWM back to the value from before entering Manual mode. H=
owever, the PWM remains the value I set in Manual mode. Although, when I in=
duced a temperature sensor to approach its setpoint, I observed the PWM to =
change.
>
> I believe the reason is because of https://github.com/openbmc/phosphor-pi=
d-control/blob/cca9c659889d149c06e95bab4b8808db4f1e3eab/dbus/dbuswrite.cpp#=
L69. My system uses DBus fan sensors, so the fan controller will call upon =
DbusWritePercent::write, which writes the calculated output value (ovalue) =
if it is different than the oldValue. When I enter Manual mode and set the =
PWM, the oldValue does not change; when I exit Manual mode, the ovalue and =
oldValue are the same as before Manual mode, so it skips the PWM write.
>
> How can the PWM "immediately" return to its original value from before Ma=
nual mode?

This is a known issue.  as the insecure validation feature was
defined, it required a full bmc reboot to reset all state at the end
of a validation/debug/tuning session.  This is one instance of many
where "best effort" clearly isn't good enough, although I'd be happy
to see patches to make the behavior better.

>
> Thanks,
> Charles
>
