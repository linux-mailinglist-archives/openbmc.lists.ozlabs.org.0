Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA48A2161AD
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 00:45:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B10y96yH4zDqdW
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 08:45:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a33;
 helo=mail-vk1-xa33.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YR3FrIIY; dkim-atps=neutral
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B10xR5KMTzDqWr
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jul 2020 08:44:25 +1000 (AEST)
Received: by mail-vk1-xa33.google.com with SMTP id d64so8981965vke.4
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2020 15:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=I0D5MaJNaS3u8+h7guikQSfbRLKEtYr1MlGd+SWsP50=;
 b=YR3FrIIYL2MdHaSTEUbvxyqwb/tj4CoGh63mEe0ArOCov3+wLUAnijV5Frq4+0FovU
 jCNJB05NJaefRNc1uH6c4IAg2x5Nt7jgun2zFuvQF8+K1/ZA3d8ucXsHavS3O77AFkN3
 xlUViPF4ZRsMWLV6jziK+3UEBLsVV/Os47D9AIgqoy9TOoVsinJ/eDKqPG5dtpykedmL
 cN5BvkyoAtGUTQsP/NyItAoNwuWvQUyB+B0/UHdw2M3a6ZVVpK4gcBeHZtPTREft75I0
 v3q/m2/kjG5Hp0U4PocklSAQbGDORnOYD8iDh24+RPKQcdCQIaCwNZiundOts0iuerdD
 R1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=I0D5MaJNaS3u8+h7guikQSfbRLKEtYr1MlGd+SWsP50=;
 b=qBtU9Hs40P+0QrAPWvuC3C5gkn2x74m0nt16RleXjIhnDINXeqXl+lrVcSw2l+sY1/
 BQBBLjBhjRPRLr8AzT1e3KJ3FE/XWANuH7EX4Pg25C6Sew6hY3oKTFHFUv3Gz4VbfOuW
 e1c28I7eZTfJ7GrLSJznNELV+D9P8R0OeKudVEI2iH5aO7hyp0YkwfHVJo3GYv/aqh2N
 IKcNN05kjyW6kxfKltlAXbCSDb/jFl7ww+DUR2/5ySMPzxR8czA6vKJmRvsIvzM9y3mL
 vBbXSfUgDWmDicaF68biauFsyhPjGYWvnB82wV9TPebBTD8M5AEPQ3u4avRVtEE4nJ/k
 LOWQ==
X-Gm-Message-State: AOAM530Aaz05UGcNjR9KnpsUh92XrbTgvhRvjf6vXD/3wziXKka7tQ28
 LBTqeg30VcgZQsTtNTPXxKYxOEPmShfGVVcNXQIsTmQV
X-Google-Smtp-Source: ABdhPJzSUA8ZQrOElNlY1xVMQG2C/FkcSuNvXJrCv6kWlG9/OVcn+KVjoVjB7jfKMXRQ4JcxU1OAeQXcyR8LsW9nh/8=
X-Received: by 2002:a1f:e181:: with SMTP id y123mr19546821vkg.52.1594075461792; 
 Mon, 06 Jul 2020 15:44:21 -0700 (PDT)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 6 Jul 2020 17:44:10 -0500
Message-ID: <CAG5OiwisQk3+PbO+tgxGfX2JuqBa1xu7Xy7FzQFgizv4rFZYig@mail.gmail.com>
Subject: OpenBMC 2.8.0 Released!
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

We're pleased to announce the release of version 2.8 of OpenBMC!  Feel
free to share the press release below.

Kurt Taylor (krtaylor)


***** PRESS RELEASE *****

OpenBMC, the open source BMC firmware project, is announcing the
general availability of release 2.8.0.

Developed by a global community, the OpenBMC 2.8 release includes
hundreds of new contributions.

Enhancements include:
 - Yocto refresh to "Dunfell" version 3.1
 - Additional Redfish support
 - Move to Redfish Specification 1.9.0
 - Redfish support for 2020.1 Schemas
 - GUI enhancements
 - mTLS HTTPS authentication
 - Partial PLDM Support
 - Partial MCTP Support

A complete list of OpenBMC 2.8 features is available in the OpenBMC
community release notes:
https://github.com/openbmc/docs/blob/master/release/release-notes.md

Read more about OpenBMC and how to get involved with the project:
https://www.openbmc.org/

About OpenBMC:
The OpenBMC project is a Linux distribution for embedded Baseboard
Management Controllers; for devices like servers, top of rack switches
or RAID appliances. The OpenBMC stack uses technologies such as Yocto,
OpenEmbedded, systemd, and D-Bus to allow easy customization for your
server platform.
