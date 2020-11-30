Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D66092C8D17
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 19:42:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClDcY316qzDqBM
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 05:42:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TesRM55n; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClDbT6FwXzDqTg
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 05:41:40 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id s18so15293125oih.1
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 10:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KLKaFKIOYkouPdo9TBcA8Sruvffr+CES/B1AIyMZVsI=;
 b=TesRM55nKbj6F7xVkAYt5AZHheo0r7/gyDA1CEx0KwFHY32+CyhhkHkOFUCxwnO2FQ
 YfxZX4eb3pFYWykKZC7wXf3afi3ylIsyfKNSrYHl4sbLaT0UuRVLcxyuzq4b59DZkX+D
 u40Q4JpWcJmSfu98hoEo575ULVNUiG7Ng+9lQS+yGCdjcPfz8CEKMrMMhSKvzrh4qTtx
 u5AMQH/c7QbiPoUTzYP9PFWLlOHlw36o5ZEQdhhu5AOgDvbSp56FOHk0sXz38GldUGoD
 sZ46ZUakNKeEdEIhSJ/akz8r4rth9YcitoXJ41l9aykwzxZ1CijzbrWEY4DmW4z0E61h
 2f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KLKaFKIOYkouPdo9TBcA8Sruvffr+CES/B1AIyMZVsI=;
 b=Th1iobUDcTTcNtqy0XXQtMUjIdnw18Jsn0XLt7l8HMMetDexIM7VmrvHudhBjcy1iA
 JFAyMHG8myguJQIhxdSH6SX1aGiMXNMM/FA9S1siyD0E1iOyyqdY53q17WYdrRU7yOat
 22TIQW/b54awQxT8x3qM3BHEEI7j96N+OG7GhoM4zEpsfcjPenxdWOYVgGfzfr67faX6
 LaczVulfM5xD/B02gthDwJk260c9wSJypdZ9cPnFCiWfhyc3jqq1Bh6ECH12juhxIMQv
 bLsyEr/j31sDpthJaZfovHj74kouYu9VYkQ7YQiokh3aWTWYm0b/UpPjK/5KaDBmAdZb
 SVzA==
X-Gm-Message-State: AOAM531v/pTyFZIZrfz9wv2KAh0YU4N30d2IuqPz2ByeIlmZhkgiZSwh
 lwfOM7uRO4i7bV8MPqcXc8Y=
X-Google-Smtp-Source: ABdhPJxXZtHPSU+PMNX5V3Mp9LU1QI3p2sI9s4B8m2YCCEUL9oTnjbWjwLpX7Yxf4pHz/Fm3tZfUAQ==
X-Received: by 2002:aca:5110:: with SMTP id f16mr182117oib.94.1606761696866;
 Mon, 30 Nov 2020 10:41:36 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:9c47:6075:1073:650a])
 by smtp.gmail.com with ESMTPSA id g6sm10288054oov.19.2020.11.30.10.41.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:41:36 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: sync meta-hpe
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <AT5PR8401MB0626829664E197404ABEEE5F8FF50@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
Date: Mon, 30 Nov 2020 12:41:35 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <E21D7292-0053-4C21-AD7E-7430DCB6931D@gmail.com>
References: <AT5PR8401MB0626829664E197404ABEEE5F8FF50@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Verdun,
 Jean-Marie" <jean-marie.verdun@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 30, 2020, at 11:33 AM, Garrett, Mike (HPE Server Firmware) =
<mike.garrett@hpe.com> wrote:
>=20
> Hi Patrick - after this change was merged =
https://gerrit.openbmc-project.xyz/c/openbmc/meta-hpe/+/38464 I don't =
see those changes in top of tree.  Is this sync normally automatic but =
current disabled or do we need to request it each time?

Hi Mike, I run a script at the end of business each day that synch=E2=80=99=
s things into openbmc/openbmc so no need to ask for it.

I was out last week so just ran in this morning. Your change is up at =
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/38632 now.

Once it builds and goes through CI, I merge and then it=E2=80=99s =
officially in the openbmc/openbmc tree.

Andrew

>=20
> Thanks,
>=20
> Mike

