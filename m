Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDEE6EE3E0
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 16:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5PTv39msz3chj
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 00:27:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=erUmTkQL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=erUmTkQL;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5PTJ3x58z3cK6
	for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2023 00:26:59 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b4dfead1bso4875750b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2023 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682432816; x=1685024816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIrH9084V4lRRI1LBhSxY0IjqfIzWuH7XMc7nqCHfhk=;
        b=erUmTkQLfAPydHA9OAxgePSaA7Syy7SWx/ybpalyRnfU4l4cftI6jqjsqYUakhWDFT
         SuSqIc7uNKc+QzRcVZSfTgq4CFwFdOe4gSDxRJthIDoTHQFRglJj7mMxFfkUkWQSa8gz
         LNRB58wJLtxWEZ6ne1D1/VLKK4E9z05dXWiuTBPsUydyVQxwXQmsE0NjGvuQ4NWoDa+Q
         fq9yct9apuxJ30O1ZJvzd4mpn7oLaUPNGsEMjdyCw/GeZV1sv0Gt9jhofSBMkkRMLKBe
         j8XN9EyKvC3rUz5jO6zlk1e2TZC52UJvPPyjgqnpErZymQ50ZwGU49qslcQQ7KLv6CpW
         IO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682432816; x=1685024816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xIrH9084V4lRRI1LBhSxY0IjqfIzWuH7XMc7nqCHfhk=;
        b=WUD5pjZE19Oyg9KFCZmHGdoncALyRgy/4tb3e9PP2YY07DLble448yg47oyzRHTHIE
         3jpXav7gva8BS+BbyKS6O6kBiwrYF6yk9dmQqnikZC8F5gS3Y3lJtkRb9fH4hsoQ4Sz8
         nEzRdl+grgPKp1MvhzcaZtlisrT/n3xbYDWzyM0tRm3OrVFfCl3Hw+GVi6XdkXkr7S4K
         2lQiOknZeNb+2Z/b1cUz8tzKrfjkOAneOAdHl7W1Y6QbXHhOxdrh8aDgLEiwkeNOzpS3
         hrS39bJWET4GKLlrV3/RuIMzfkeDwoifLg4TDiSVax6oQrx6tbZX6t30HC+nWabyw2um
         bX1A==
X-Gm-Message-State: AAQBX9cah4Tc6tfWSHtIsrYtB7SncFc23xUYroEb6DkQSyXR7v74/R2f
	uySMUoDNqrVbvBGSnjeLNNFN0FiB4vM=
X-Google-Smtp-Source: AKy350Z56T0vJIAIthepiBZqtzNnZCksWaFw2B7LrYbEReke7D7dM0c3DADwOvTVYoUu/y9erYMf/w==
X-Received: by 2002:a05:6a00:1a15:b0:63a:d2e4:cc35 with SMTP id g21-20020a056a001a1500b0063ad2e4cc35mr22982477pfv.31.1682432816341;
        Tue, 25 Apr 2023 07:26:56 -0700 (PDT)
Received: from smtpclient.apple (184-167-248-253.res.spectrum.com. [184.167.248.253])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a00078100b0062ddcad2cc5sm9352202pfu.30.2023.04.25.07.26.55
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2023 07:26:56 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: etcd in openbmc
Message-Id: <CD1A5B69-FE10-4122-8D85-DDD501B46CDF@gmail.com>
Date: Tue, 25 Apr 2023 08:26:54 -0600
To: OpenBMC List <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
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

Greetings,

We've started to prototype the use of etcd[1] as a mechanism to support =
a
system where multiple BMC's will be a part of a single composed system. =
etcd
is a strongly consistent, distributed key-value store that provides a =
reliable
way to store data that needs to be accessed by a distributed system or =
cluster
of machines. The initial use case is to ensure phosphor-settingsd and
bios-settings-mgr values are consistent across all BMC's in the composed =
system.
With a bit of hand waving, the idea is that we have a compile option =
within
these repos to build in an etcd plugin that will utilize the =
etcd-cpp-apiv3[2]=20
(c++ wrapper library around etcd) to read/write their values into etcd =
when
enabled.

Our primary use case here is that our BIOS/Host firmware can come down =
to any
BMC to read/write BIOS values and the OpenBMC firmware guarantees the =
data is
consistent across all BMC's. Also, we ensure all BMC's within the =
composed
system are utilizing the same phosphor-settings values.

Jayanth and I have started the process of getting the etcd recipes into
meta-openembedded and have some initial WIP patches up at
https://gerrit.openbmc.org/c/openbmc/openbmc/+/62509

Thoughts/Comments appreciated.

[1]: https://etcd.io/
[2]: https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3=
