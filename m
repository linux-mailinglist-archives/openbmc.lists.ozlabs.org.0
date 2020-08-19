Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE65B24A69D
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 21:14:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWyC56737zDr0L
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 05:14:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92b;
 helo=mail-ua1-x92b.google.com; envelope-from=kwongyhue.chow@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ncl4EO1V; dkim-atps=neutral
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWy8Z02qHzDqyg
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 05:12:23 +1000 (AEST)
Received: by mail-ua1-x92b.google.com with SMTP id x17so7227674uao.5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 12:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Gb4PLvlIvqScxYKhJaM9RXg2bJKqbEDvBiol+uMYHqI=;
 b=ncl4EO1VzUN/1J4z0nTV5/ar6a5kfUJeqJ7MCBhxG3euU0l8AvBvXsZNMsLB8Oz2nS
 AF8FaIBBV+4dFOZtHg4pVD1G+XdC6vLxQCXIaBBplnQ9e3Wkr/TTvXP7xk7vRr0hleC9
 bIfuGyFPhVg1JKso/Bagr+b7mgLdTEUeJF0ZdpYzrCRD3trjK/4IKkUOyrmOur3GFOmu
 SisYp4StEOYfyV8upTbAJsiJ2NhehbnxXefq0c/9ZGpSAscA1J3oS8XEWDxeKU/dhtCG
 gwGF0hn7eTc/Ig8kOwXLlkVpc2i9PX+EzlzoD/a3GZoUvcKoXY1f6byMV5rZnmv+PRMJ
 K6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Gb4PLvlIvqScxYKhJaM9RXg2bJKqbEDvBiol+uMYHqI=;
 b=ULDzMIWRw9alVMQIt69TImsspf8rKuQVkVCh6OkUdfVVgkN/JRfVqG0p672lzSOxlE
 YXwlPbpG4zooa3amwJ5jwNWoVV7kgyMW4ieWoQkZKldSmCDdIwTlL4PiXCy/IHwAUJfV
 avpLHpchoim0RcMMaTW7dvMfabshkEq65NuVtPh1Zj8KDRBngmNQaXcnbYcI88bb1dKm
 M58XuI5z0vPy5csF52aECHisSQq8AndUrHmCApLz8WLHdEgL0TMgF+1K8BO9dhl7MnX0
 I2W2QiQXlXOA8ii2Vmm2cg0U0dL5Eqnb+AW5mL5iEA4qMmJ0lpIEGHZyLvsPvF5WvXlN
 FIDQ==
X-Gm-Message-State: AOAM530HPVLRKp6kDVOznS+RCPO9pnvQfCSp5d9jZFa2Gmm/HEahm19l
 aDcWzNzVMhU1+njiSlBhYxy2xIr2LAg0h46usE/DWFoh6Ow=
X-Google-Smtp-Source: ABdhPJyjdSg39343iNy/5antAGEjO8D2KPyfBvOwU6rFyeReqs50ySxGWGyO50ZddVbuCULMJYoLO60Qxi8x56Y87Ck=
X-Received: by 2002:ab0:6a5:: with SMTP id g34mr15164957uag.53.1597864339973; 
 Wed, 19 Aug 2020 12:12:19 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Chow <kwongyhue.chow@gmail.com>
Date: Wed, 19 Aug 2020 15:12:08 -0400
Message-ID: <CABg4NFNhVXt59apmv331zRNXExvN23cS_vcNPddfVCQntPSCtw@mail.gmail.com>
Subject: BIOS Configuration
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000062297205ad3fc8e3"
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

--00000000000062297205ad3fc8e3
Content-Type: text/plain; charset="UTF-8"

Hello,
I have seen some talk of remote BIOS configuration in the works, but I was
wondering if anyone can point me where I can start looking to configure the
BIOS locally. I would like to start by doing something relatively simple
such as setting the default boot mode to UEFI/Legacy.

Thanks,
Ryan

--00000000000062297205ad3fc8e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>I have seen some talk of remote BIOS configurat=
ion in the works, but I was wondering if anyone can point me where I can st=
art looking to configure the BIOS locally.=C2=A0I would like to start by do=
ing something relatively simple such as setting the default boot mode to UE=
FI/Legacy.</div><div><br></div><div>Thanks,</div><div>Ryan</div></div>

--00000000000062297205ad3fc8e3--
