Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ABB17407
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 10:38:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zVH24G5nzDqDb
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:38:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=leetroy@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Am7ICoot"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zVDk0SG0zDqKT
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:36:05 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id a132so3443022oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=F4gREXXakK2PH2ZyF2geS9uX4r93ZCFGyoLm5umubjE=;
 b=Am7ICoot2JrJhVeKT14suTMVg4rhBIKQSW5AMi72ztx2iWFSd3Kepp4ZlGdY5NJ0Re
 G2Hv/xGAzj+CMskmMVKkOOE259iOVuvQwHbDKotQtv4kZovxPpyvdGQmnO1fxSkWYLYe
 M8tG2FmTBorC6N+HW8X3tkNREIpTa5IYJddLX5gdPzD0VTDg4zruQkfQ7l2WhMYBrizx
 ZG6EgCcy1zfHHk1aYXQY+D1dwldmIu5DZT2GlJOUlitIrUOFZ0B1wDbX7WEymzWk46Si
 71sGZ0tFD9vmgXjWnkfTP0S7doPVoWmpasKo8oKk8QFO7UR6py929vvYNqePtnzM8aYC
 EnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=F4gREXXakK2PH2ZyF2geS9uX4r93ZCFGyoLm5umubjE=;
 b=T6C+Eb8bwi2IU0fR4NZs3KYH8WvGSHOjydT2ni4f+dpU0mr5CjKBHXizDWbRGDRloW
 tAyOiAz2NvMq2zC8nLBbl0DSc3YGES2MrBLbIWb7l0DpNYNBWfYKGXoDPBO6pKzkOXji
 YL4sPMZ18rhsp12b3zcFkQpidqfDNYHVx+7N9r2FL7RQiN5Q/yHQv2b3nY4ZAd/zkK5+
 qfPg6NZFLjQVtX6yxe5deglyatiIutBZXWszI5KE1kueUzqG/uPEjw9Ha2I/EjyZa22z
 u+uL59TWjvl4g/gCzpiVQkUXxCBiHy2SNxGFetwLiw8jnTO0NBZZMmzXHUdkykbJbPxJ
 EKLg==
X-Gm-Message-State: APjAAAUWZjiJV7fyquhKLkzf3TR1si6qCzp3BoOpA+i106sSmVYbS4ag
 asp8MbfyoJt8hgDU4HxSNmbhVH6pYRBHiKa1sfrZ2RGNDOg=
X-Google-Smtp-Source: APXvYqzGViaxRC47o5FtYQpAbnWv3NGdSPvF5n3ZrlqttYSyJlsOoFBhstQey3OcxsQceP54qNB9Ci649emgRJ2jztU=
X-Received: by 2002:aca:5607:: with SMTP id k7mr1357167oib.116.1557304561668; 
 Wed, 08 May 2019 01:36:01 -0700 (PDT)
MIME-Version: 1.0
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 8 May 2019 16:35:50 +0800
Message-ID: <CAN9Jwz1wvT0nhoTb8K9Qf-MTARc3q8kxRQXSH1TCA0e5nJFY4w@mail.gmail.com>
Subject: How to deal with incorrect firmware image in phosphor-bmc-code-mgmt?
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

Greeting,

With the method xyz.openbmc_project.Common.TFTP.DownloadViaTFTP,
does OpenBMC have a way to know that TFTP download status(completed)
and the downloaded image is incorrect?

It would not be a problem if the image is correct, since we'll have an
InterfacesAdded signal.
But if the image is incorrect (untar failure/signature mismatch),
we'll only have an error log entry generated.
Or if the image has the same version id with currently running image,
the behavior will become unexpected.

Because we have another service wants to integrate with firmware
update service, having a way to confirm the image file is nice to
have.

Thanks,
Troy Lee
--
Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
