Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0110E515
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 05:36:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RC3y5Ms1zDqR2
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 15:36:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TeVpInCh"; 
 dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RC3D53xGzDqQh
 for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2019 15:35:34 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id t5so7063728qvs.5
 for <openbmc@lists.ozlabs.org>; Sun, 01 Dec 2019 20:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6NugWRr1H45PsYydDGs5D5bbdbg9fR7gAUfjFuU1FiM=;
 b=TeVpInChdntrGQ/8ywtkDDTKZx8nCM5r1U8pZgvikahWdsXFTXovKXHTeC69AiCI8M
 SvvBKxdOZgAzeEo5FKMYvu9NJQitAFOtckZ2EsVcHPQ0ahPQjTEEk3Qs8VdSZ+EfnVuu
 JMsSLzd9FYeuuFBYHUoTJ7uEgmfKIWy84utiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6NugWRr1H45PsYydDGs5D5bbdbg9fR7gAUfjFuU1FiM=;
 b=Pegd3PqGn+hqaAcQxACkgWEDbyriCE5TCCdknfwzT3hUYjBqCUDg86bCrfePggEui9
 lBqgRUq6BuoKO814CE6h50Wb/cHmy2M16D1dDe8j1wA4zlSoare1gihEyrvjZ3Y5PoAw
 c7nyRTL1T90T324xKQjRT8TCGIz+bOv/mtI4I9jERaQbxWxylW2jmcBi+YzeUryprvGg
 bGPkynH8xsL/3dUFaL+yUEDO1u7HJEIPlCU1wsKkRMHkUxeDujdACRfVRbY7H6k7Yjs4
 E1XzQ7o2mtw/+xXSwIkfAnNJSbAPWBwt7JDFcKjiAwVDJy1ko02/h511AcN1GlghQY0P
 UsWA==
X-Gm-Message-State: APjAAAVIUDUaMzzHFfbsmu6bX4KyXt0YQlm4D3RETmGWzSL3JcQsuoAy
 KMGu7rgqgGGfgYTuYGbix9u/wAcl/N+EG4pK9+27cmS+
X-Google-Smtp-Source: APXvYqwwJsgbOWTIMPa5INyCGF+1pOmjwaKbijgdXWdS9Q1S6X5QkwKqxsTToKK1lig8naTUJf7xgj0nHWDn1WJxjLk=
X-Received: by 2002:ad4:4e62:: with SMTP id ec2mr8585794qvb.2.1575261329921;
 Sun, 01 Dec 2019 20:35:29 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Dec 2019 04:35:17 +0000
Message-ID: <CACPK8XffZqTq3YqEEcA7mm4d1k0V30o1TLE79nBOGrVcEBCjog@mail.gmail.com>
Subject: Dropping PECI patches
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jae,

As I have not seen an upstream submission of PECI for a number of
release cycles (since January, over 10 months ago) it will be dropped
from the OpenBMC kernel tree.

If you still want this code in the kernel you will need to make a new
upstream submission.

This aligns with the OpenBMC kernel development process, where a patch
is carried to assist developers who are actively working to get their
drivers merged upstream

Cheers,

Joel
