Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D080767684
	for <lists+openbmc@lfdr.de>; Sat, 13 Jul 2019 00:28:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lnd237vnzDqg7
	for <lists+openbmc@lfdr.de>; Sat, 13 Jul 2019 08:28:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Vdl/XLXz"; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lncQ4MbRzDr0R
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jul 2019 08:27:49 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id h6so23731810iom.7
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 15:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=aKmMLuhDS6/tEuEmg+ikzxgDxKBrftzgRThVzOZkn3s=;
 b=Vdl/XLXzncHw0ww+0xG3iJXrMnNk5/MG4XKiiipajmYMQ35MAxgd9uj/ViN0zAA3gv
 EqQxwM+PhyBUzYme3iH7CWKCpv6uQ8bfacGk9cnaWuuypOY/4k9vQ95+vjlAqPpXex0S
 2Qo/eUXd99/9PgQZOb+a5OEj9DXd6/Lka8m18wm8xxOKF7pU4ujy384L4mBo9shVigPr
 BFAKIjHN+zrJ5aa2QdNuvvVmXTcEvJs9IP1h9l2g2/0Ro54WU6/oAoydeuzGR8u8SxbH
 icZ/o6RG2EFLEn2euOhYYdB8PkxU9g8INZfksTcyqCnkFDQigXMNrEWj2eC88ueMNKkF
 T72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=aKmMLuhDS6/tEuEmg+ikzxgDxKBrftzgRThVzOZkn3s=;
 b=NVAh2HBbII/FIH5oGath2cep1byvQif3zsj+w2i1s/ED10t6CS6Xb2LmW9SYkDpAex
 sCp6CORA7X2prw5zNGg95RR9luBdWbbAyk/mLHmhf9C61IdZHPRNi7hWU6iBTuCnX4Wd
 qXmMFsk454G8oRBiZfohXBAWVXYNlrQ/pRr9pfNZFUF8F/jeoPNqc4t6tm/7XvIRWjyE
 hOvRBlVx951H6djJW2n8QFdEgOkXAZoErvQ+4vVeikj7sV5hdzc7b5bPR0ZG8Sd+Fcei
 xSjP94vH8Wpicj3O2wzimIAZ2X8+PTyxpzstHQC8G8NuJsPuPeP8/j690Q9xxcHEgPOH
 ifsg==
X-Gm-Message-State: APjAAAVpBzuweNAZFINKTUGCVknFpa++gtsY+RRUh547/nYymJwOEVEj
 cDIS9O4FboTMb6bth+TPdqTwLubGa3QwFG4rlrrAIg==
X-Google-Smtp-Source: APXvYqxpZEl65dtLG0sfS+xxYzsdvx3pnmm8bu7lwd/3TSKRZVdBcsmVjHIHx80dVS8jBOGHRiCZR1fzOHv2hGriIts=
X-Received: by 2002:a5d:91d7:: with SMTP id k23mr8436243ior.163.1562970465278; 
 Fri, 12 Jul 2019 15:27:45 -0700 (PDT)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Fri, 12 Jul 2019 15:27:19 -0700
Message-ID: <CAGMNF6WpQS06JDQJOKRLbKWwKrXKHvNtY7r+MnUTqp1G2Jn=qg@mail.gmail.com>
Subject: Proposal: configurable per-sensor error behavior in phosphor-hwmon
To: Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 spinler@us.ibm.com, msbarth@linux.ibm.com, mine260309@gmail.com
Content-Type: multipart/alternative; boundary="000000000000616ea5058d836bc1"
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

--000000000000616ea5058d836bc1
Content-Type: text/plain; charset="UTF-8"

Hi there,

Current phosphor-hwmon code is filled with preprocessor macros to branch
error condition for sysfs reads, and it seems to me that adding a
per-sensor configuration would solve two issues at least:
1. code can be greatly simplified
2. we can code more flexible sensor reading behavior

Why 2) is needed: with many types of sensors that BMC controls, having an
one-size-fits-all policy will always have cases that it can't handle. Each
flaky sensor is flaky in its own way.

Rough proposal on how this will work:

add properties to each sensor group's configuration file:

"error behavior": can be one of
- always keep
- remove from D-Bus on error

"error condition":  can be combination of
- certain sysfs return codes
- timeout
- invalid value

"error retries": number of retries before declaring the sensor has an error

Happy to hear any feedback.

Regards,
Kun

--000000000000616ea5058d836bc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there,<div><br></div><div>Current phosphor-hwmon code i=
s filled with preprocessor macros to branch error condition for sysfs reads=
, and it seems to me that adding a per-sensor configuration would solve two=
 issues at least:</div><div>1. code can be greatly simplified</div><div>2. =
we can code more flexible sensor reading behavior</div><div><br></div><div>=
Why 2) is needed: with many types of sensors that BMC controls, having an o=
ne-size-fits-all policy will always have cases that it can&#39;t handle. Ea=
ch flaky sensor is flaky in its own way.</div><div><div><br></div><div>Roug=
h proposal on how this will work:</div><div><br></div><div>add properties t=
o each sensor group&#39;s configuration file:=C2=A0</div><div><br></div><di=
v>&quot;error behavior&quot;: can be one of=C2=A0</div><div>- always keep</=
div><div>- remove from D-Bus on error</div><div><br></div><div>&quot;error =
condition&quot;:=C2=A0 can be combination of</div><div>- certain sysfs retu=
rn codes</div><div>- timeout</div><div>- invalid value</div><div><br></div>=
<div>&quot;error retries&quot;: number of retries before declaring the sens=
or has an error</div><div><br></div><div>Happy to hear any feedback.=C2=A0<=
/div><div><br></div><div dir=3D"ltr" class=3D"m_-126363046774815673gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>K=
un</div></div></div></div></div>

--000000000000616ea5058d836bc1--
