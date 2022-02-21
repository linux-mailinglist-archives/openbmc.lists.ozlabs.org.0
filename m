Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A54BEA3F
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 19:23:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2Vzs2vjnz30gg
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 05:23:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fd3VcQSN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fd3VcQSN; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2VzR3lK6z2yLv
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 05:23:13 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so7969089otl.12
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 10:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=Oc5XOdTJE8K1F2SZ5YFSR6kfZP91ZypzHYdGJvW9jCs=;
 b=fd3VcQSNMEpJ7+Q3ikdNkh2z8Sef8xUUM3N9HtbXqp4fSmHRrTNAWFYIbBo+GbydMo
 xKp5g+UQ9nNYdaSyM84eQSyhLtWL/UEoh7E5cFZNgnrZD116mICLCdIJmUjUQ/e7PgEO
 Fb76xvKN62RSOdbxm6064wSBERZxnbUX+1gGDBMb4jgIE1+iWJjSNkH1o2TdSXEQv60p
 Gpkm/Az1cV6fkB02+4CIYzWaCAYE5Kw7O5lncIuDBgMeDLZmOtV0V6du9N2vPv3aBsHO
 tXmYIy1/gwASNUnvttosAowHKWJmKemWDMMsTvIhQNggW9x4WT2HtL7ZxaP+bXTGsURX
 kyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=Oc5XOdTJE8K1F2SZ5YFSR6kfZP91ZypzHYdGJvW9jCs=;
 b=j6UvtU7KZaM+s6R4Dt7ScNnRvyquyeknETMFWA2wfcy0GX/w5GQY4rwVgPSj99TfQW
 oeN/cMRd2NvA5lc0XZ4kV4WV9qaZbCpWM/RfFlzJIxwFLtlQtGYP3o2IcnR6tBWcGXOT
 Lv8liDtM/QcA/iWhAg0e29fl6eodCFJcOoYA7bT8LPGF0Js59p74qo1Q+l1qTQMO8uyC
 BvF3i48WLWzu9+jw1pgqqoriCUXkJTVbyQvsyjIaHxUpIxCWVMFKqttj/XywzOX4k5x3
 IeuGL6dfhu/yQEryihk2B/t9xcrIlyDe9uPHL1V2rZo7IZmkvkEbRI0slhr5g8VvMZDs
 OeaA==
X-Gm-Message-State: AOAM530gq3Qs7NM0Cdko5I+eHLltfSzIC2awarJcOvDxdY+yStcs3M2j
 BBq1le1/pQbgMdobkwXLsQAV1tlkCB8uQw==
X-Google-Smtp-Source: ABdhPJxpLtJaD9sdKhc/4Kd6h+j93EXa62QDGAWF9fEEY/3FmgLauVQBMxJ27icpFxbWFGrooQerrQ==
X-Received: by 2002:a05:6830:2709:b0:5ac:4ec0:6bd2 with SMTP id
 j9-20020a056830270900b005ac4ec06bd2mr7247663otu.19.1645467788489; 
 Mon, 21 Feb 2022 10:23:08 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:6d06:d060:5868:a6c5])
 by smtp.gmail.com with ESMTPSA id j2sm5309521ooj.2.2022.02.21.10.23.07
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Feb 2022 10:23:07 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: validating secure boot settings
Message-Id: <9C969ACE-F369-4A24-995B-5797426DDFDD@gmail.com>
Date: Mon, 21 Feb 2022 12:23:06 -0600
To: openBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

IBM has a feature[1] they=E2=80=99d like in regards to validating secure =
boot settings.=20

The basic requirement is to utilize the new bmc-secure-boot GPIO defined
within this patch[2]. If the GPIO is found, then verify the system is in =
secure
mode by validating the GPIO reads 1. If it=E2=80=99s not a 1, then log =
an error.

Similarly the code will also look at a sysfs file created via this =
patch[3] to tell
if the system was started with secure boot enabled in the firmware. An =
error
will be logged if it was not.

=46rom an IBM perspective, we only want to run these tests if we=E2=80=99r=
e in what
we consider to be the manufacturing environment. What we use to =
determine
that will probably be something configurable with the code. There are a =
lot
of other things that will prevent a boot if the system has secure boot =
enabled
and the security checks fail. This new function is just a mechanism to
provide a quick check to our manufacturing team that they=E2=80=99ve =
enabled
everything as expected.

So, anyone else interested in something like this? If so, any votes on =
where
a good place for this logic to reside would be? We don=E2=80=99t have =
any obvious
security repository that I can find that seems like a good fit for this.

[1]: https://github.com/ibm-openbmc/dev/issues/3462
[2]: =
https://github.com/openbmc/docs/commit/d55349e10ec2432886b26b00322ef0eaff2=
b919a
[3]: https://lore.kernel.org/all/20220204072234.304543-1-joel@jms.id.au/

Thanks,
Andrew=
