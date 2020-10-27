Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F9E29CB89
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 22:52:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLQQl31J6zDqP2
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 08:51:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PNVJzw5x; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLQPf6VkDzDqM3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 08:51:02 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id m22so2511904ots.4
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 14:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=64QSk4nfT0TSsdmIWEX+G8flHeR3bRjD4IkHqfbc1H8=;
 b=PNVJzw5x2nyUcf4YQMP9ZI8qGiRzTqHT0yMgRIcdxCtZNj0h0hfK9CtfTERHzrQr4Q
 XUkYMCrQpFtU5SFJhMI3ZR6q5QSQaU6L2Iu1SI4XAkUtWlKQcULzK5LpLU2HRaOPi9cQ
 gv/JlXSDYbxjmJeqFQpMB7AEI1qfCiyJoRZh5EbCHlAlx41dBZgx6dQgxqKVtvDGkroc
 QBqkTuTaWk56lRXnkxC5hWfzbCcbPckqTXbw0pDWVmK7CAAT6h31E8lmaN0skqa6AV2x
 jJDiFwDo6UCfgU5hwdIPIVMxovtN5icljcj2rKSUiSVokQsdNce3FxuHIF7XDC8yIBse
 zI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=64QSk4nfT0TSsdmIWEX+G8flHeR3bRjD4IkHqfbc1H8=;
 b=TDzTBZoWyGxXEBvKXtnQaPhP2PicEdznVUDjbglLqTDHPXtcrMvgvcv9oz91I7+OaS
 uZzx8unNYBE0y4hUmyR8sNQkeHQSP2juoNq1ONJV/oGkQ7XYfxv8DurCLsgW9SAFfMpO
 USB9DG08NcgjCmIFVKCtXo7Nd+nIHd33CtzCU+DpB4vTGu+kwIp/wTdhqK2B42OcFkHD
 LqQtexC1I0oDXfjVbH5qnIrRkXWGjkDqXE6LjA8Cw74SsehEgWG/Eczra1XPTV7aUv08
 KxBtUQcZviZNhRggjuk+MO1Rpd5tBwP+CySi/krlmhFquSw5i09ppTFj1rbN/0SZHWKP
 nLdg==
X-Gm-Message-State: AOAM530DysdWS/wfjZsHmJc1DpZU/mb5cbckegqGNvU5Rx6fkA4MFjdr
 FMUTzcZCsq78iFbzHOV6pJdSQ4PNNG2S8Q==
X-Google-Smtp-Source: ABdhPJzrn1/QZEyexPGU2wXgs68NIEHW4Fm/hK9AAyiH9Z4j6woSfk70Xq2fms1FuUMCfco7/yHzLA==
X-Received: by 2002:a05:6830:1009:: with SMTP id
 a9mr1363915otp.312.1603835457871; 
 Tue, 27 Oct 2020 14:50:57 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id 9sm1581906otp.72.2020.10.27.14.50.56
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 14:50:57 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: soft power off via IPMI and PLDM
Message-Id: <47DC719D-6D7C-4C06-8C57-E52C25F340BF@gmail.com>
Date: Tue, 27 Oct 2020 16:50:56 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The soft power off function is where the BMC tells the BIOS firmware =
that
a power off has been requested. The BMC then waits for the BIOS to =
gracefully
shut itself down, and then powers the system off.

We have this implemented using the inband IPMI protocol via
https://github.com/openbmc/phosphor-host-ipmid/tree/master/softoff

We also have this same logic implemented using the PLDM protocol via
https://github.com/openbmc/pldm/tree/master/softoff

I'm wondering if anyone has plans to utilize both of these on a system? =
For
example scenarios where a system may support different BIOS's that
support different inband protocols?

I'm thinking the easiest solution is a bitbake DISTRO_FEATURES option =
that
installs one or the other. If we support both, it gets more complicated
because one way or another, they will need to know of each other. i.e. =
if
the BIOS responds to PLDM, then the PLDM service needs to kill the IPMI
service. The design currently is that they sit in the =
obmc-host-shutdown@.target
and the power down does not continue until they exit.

Andrew=
