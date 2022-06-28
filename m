Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9377F55BFC7
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 11:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXK711Rcwz3bwk
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 19:29:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eB97lciR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eB97lciR;
	dkim-atps=neutral
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXK6d3F0Xz3bq3
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 19:29:10 +1000 (AEST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-101ab23ff3fso16367703fac.1
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=r2DFgsXPniyoMATnLOzi1aJJLyleOyOm2aw4GEyS/wI=;
        b=eB97lciRKAjoX/RiIrJqzBrWxIfRfg0h487tE3CSYqev4+Z5ruSvWSRppODq7Kmk1f
         0OA2YQX6JpAMxiW5tql7y7W6VTm2Zm25MCSdMXZ8J5f58M+KS/Iqvt8Sgh+qBB5BQrkq
         XiRuYr4Qekw992PMVyUslCqmRvAzKcRv0oZSFD7HHPU09x0r4RQV6IRKwBEaWchD8F52
         hXHnHVUsSmngKvu5a/HTA05r0k0EfOrRpA0JRFomiTXJLxWjsmxFQn3Z6XcyPeh0yhGl
         j5BnMuRjUYwgpYMiYRariv0vm3ZSjrIh8eJialkCCDRseGmI74GXr0uAlwv1IxdK7NgH
         JTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=r2DFgsXPniyoMATnLOzi1aJJLyleOyOm2aw4GEyS/wI=;
        b=qaaXVULtcHgdL8GNfM48fFPHNkTp8gAOGAJiFugf9F712wKTO0wlF/r0+7GLIgcFLW
         DiS+L8H0CvZUZIphb5qL0h8Kn5yGPHuk+SyLgR7lIx0ALA49uKFhaOPq/dwebJI55/Ea
         5VEVJpk4Fh1ufgNm5lsexxL0AuMxvEQw7PxwOVc0g/BFwMKd9hXEO915EUTwKq8ZrEV3
         TxPWn9i8iD4zPtw9XCKTYcFjsfV9dtycbpkkaeRHhBIeyIB11NC8GIbKKyKaZK/D9G5S
         jVAD6pjlSWeG3Hg8Ihy5tcNyFkiUNlVA2URvoV1PffTzdhtwXn3tph19xRU3v8SaMaEJ
         wshg==
X-Gm-Message-State: AJIora+UDQrel9M+8tY12AbbZC2IbUzP+KFlxDuP9PzFaoQcZMFQN3+I
	Rnn+6jg3AQsfuk9ljDj5NFneTAvdN63Vc8NKM3AoSU1Z2MbAK8Ag
X-Google-Smtp-Source: AGRyM1tlMS0SHPBM4U75E80jxOfuTPZt63I15/z0VrpRhAY5D49+kV6bcuGmBymEiwoTGk9o1U8AxcmdjrS8xGC648k=
X-Received: by 2002:a05:6871:98:b0:100:5cd:518d with SMTP id
 u24-20020a056871009800b0010005cd518dmr12935711oaa.294.1656408544245; Tue, 28
 Jun 2022 02:29:04 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 28 Jun 2022 17:28:54 +0800
Message-ID: <CAGm54UG5R9Kv9_y44KBHztzr7Zio-1ofofnNQjm0yNA0G=OO=A@mail.gmail.com>
Subject: Handle expired certificate
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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

This email is to discuss a case in certificate-manager and bmcweb
about the expired certificate.

The issue could be described in the below steps:

1. If BMC starts when the time is invalid (e.g. the date is in 1970),
bmcweb will create a default certificate with hostname `testhost`;
2. In later reboots when BMC gets a valid time, the bmcweb loads the
certificate as before.
3. phosphor-certificate-manager will throw on this certificate because
it's expired. Then there is no DBus object created for this
certificate (`/xyz/openbmc_project/certs/server/https/1`)
4. Due to the missing DBus object:
 * We will not be able to replace the certificate, e.g. by below
Redfish URI: /redfish/v1/CertificateService/Actions/CertificateService.ReplaceCertificate
 * When the BMC gets the hostname, bmcweb will generate a new
self-signed certificate with the hostname and replace it, the
replacement fails as well.

The problem is actually related to Redfish URI "ReplaceCertificate",
that is to replace an existing certificate.
If an existing certificate expires and is rejected by
certificate-manager, we won't be able to replace it because it's not
on DBus anymore.

A patch is sent to
https://gerrit.openbmc.org/c/openbmc/phosphor-certificate-manager/+/54947
to allow expired certificates, comments are welcome.

-- 
BRs,
Lei YU
