Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC67C651BE
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 08:13:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45km2P233BzDqjn
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 16:13:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mUaptRzv"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45klzk1VYZzDqgL
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 16:10:57 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id g20so9971127ioc.12
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 23:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3t8pT8Bt9YHAZ2/woW+xcR8k99k8MtRCGGMOqTxc1O8=;
 b=mUaptRzv7Fn9q0d5T65skyjtKMHNtcS+Oii6HkdGEfZT4b22sP9jBfYzJETJCPOd6/
 IjYfW3e3PgGd+BXDVmKAv3oXQmLFfT33xqYurWJ1QTfQ2Pkk/lIEZadyFcRr5UPvHVHe
 sYsGLycwTVLUHmTKA1uVTZ8GkOTDGrCfYq9ueGq8+3A9AlhIHMkbWXhVcrwwkCrlX5lz
 xThcHMZv8m/Yc0QTWScLjE5XXbRAnqowbYkup63hQuzhzF9f3CcTf8u1xLQmKoIkYhmQ
 9Vai7gWsLHsbyi8SDn/S6NHEWloUlnWjkeExqPM7ZnAPw2SQSyA6pE6yZTYIC2cXaVIa
 d4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3t8pT8Bt9YHAZ2/woW+xcR8k99k8MtRCGGMOqTxc1O8=;
 b=gVtyIERl7RT5nseovz1Ug6t4tRzaMzgyGjRTUVhg7zZgNQ8AuWIFYczgXSqf4wnZK8
 ZJVsr4eOPoY0vNdx9N5bvhuqyzCwID7EMcL2KoclmeTdDKfJziSHcxtUyxgiwR7FkYQE
 KtKg8SSDnkyEkw51okrm3JktEVeAqKy2kWdQzRlCbgJT+RSMrkIZ07aqxrjOv/ED1x2M
 uRCVM1zXkmUo8OPCunlZiA4cpGKmLjcEch31XQUDb5H1igX5q9utMreadFhhy5ibaE5M
 xtvVGIcmYScLhbfeC/NI7IJ1Q2WeJzaLpTcJ8cBy+Qsmtj/EmbxvY8jMzXtsS2wMM5DO
 s9XA==
X-Gm-Message-State: APjAAAWeNJXXAQnj0Ih95G9z1zDxNwj0xrlMEMMEu+p0HqJPxtR0KNRi
 s6JyrFaBbvpZ+GUSetMvm1f/85rgzQ61bJRmDA7PX1s24F8=
X-Google-Smtp-Source: APXvYqzZQs01Tg2lvMsRfLtkoCEACJUhoUdT4FMzHsXBWFODXv39R8YTwwHMxSikj346miuUZeuL9hm8/0FxhEdBM4Q=
X-Received: by 2002:a02:aa8f:: with SMTP id u15mr2564348jai.39.1562825453979; 
 Wed, 10 Jul 2019 23:10:53 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Thu, 11 Jul 2019 14:10:42 +0800
Message-ID: <CAARXrtkB5A7H+fw+yQbQEFO7y0LknnDutgKnvjAUkp3A_srbMw@mail.gmail.com>
Subject: New repo request: phosphor-psu-code-mgmt
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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

Hi Brad,

Could you please help to create a new repo for PSU firmware management?
It could be named like `phosphor-psu-code-mgmt` which is consistent to existing
phosphor-[bmc|pnor]-code-mgmt, or maybe help to suggest another name?

The design doc is under review and it looks like it's going to be accepted:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22821

Thanks!
