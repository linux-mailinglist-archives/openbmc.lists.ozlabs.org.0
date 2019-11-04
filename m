Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BBFED8A6
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 06:40:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4761q76TrZzF5Cp
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 16:40:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DSKX8oup"; 
 dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4761pN2yKczF5Cc
 for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2019 16:39:55 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id o18so1512557ils.12
 for <openbmc@lists.ozlabs.org>; Sun, 03 Nov 2019 21:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0Xen8St83OtVPuxFJ/LJW5vSr0yvRFTOzR8+HwgLTUQ=;
 b=DSKX8oup9D1QRpwi9GMLy3m2Wgg86m27ej16GoTOJoV5nhtRRvHEufBtNdfN6b0C3Y
 dM55oTnOWGzxB/oGz/YdydWrKY1GFhL7zxbWT2u4tGK+QVhocKfBE2uEM+9q2Oo+4p1D
 OIJrKQiTy2rw4uCACtKF8TuLFSe55xAhz6ApdigTWmWSFIK3j0+AGCrGX/h0ERWnrnyJ
 QpNHTNtOZRHm0+9YNqFpB63Dmxf++lbXLJzpnSnJ+PlihO13zPUvWvqCathPXhc98hr0
 l/Ubs2FDpQVBMCCyxo0/TBWu3LqQlqwjX6nLJZOFPrpHgl0+jMZ38q+2htmwTJQKrVsX
 xkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0Xen8St83OtVPuxFJ/LJW5vSr0yvRFTOzR8+HwgLTUQ=;
 b=hmgDsEUC++HeCygnAQ4gb5p0VJNf0lh92iWt6yp4YRqxWZjhTmOgZSaYzKJPc+P05D
 LgCDxxs05Y0FNC0/EZ5ph3wZLGJH+rvnpTocsFve5XyO3lfBHX49XmLDbyIm6boSEaDQ
 Oa1Vcgf3qLspoE2hP9mbi+oRVhTiuU3FrP49kkcbfxSMxQyL/fGH9HFmyL5Nu9YoztYs
 MVOFFPtiUVjPGRB6wj21ExqDygkfscP9BfIsSc4WsYGLmVLo7BfKbtuuc/7aautYIbzx
 /NsdxenmfiHcvuv7YLNUp4glXrOUMVgHZwN0GN99hqQTHs2xrQy+UPaFLqzPrRVFWOGS
 zFvw==
X-Gm-Message-State: APjAAAUC2uDwMB4SeBedM9gg99GZHNTw3yR8dLIrPNMhVCpHsR9EdCO5
 c53EmctfI1fQD2rIVlH9nrgyiarBXLeVcUzEr35IJrI1wDo=
X-Google-Smtp-Source: APXvYqycgLzVk6W46Wdc49M9IT5PevI5BC6IhaXSPyp+bj/blmEBjxFkiJIRMJ0xU6099PXu9gh5mp+Ul+bfCz5sCZI=
X-Received: by 2002:a92:af19:: with SMTP id n25mr28194084ili.138.1572845991884; 
 Sun, 03 Nov 2019 21:39:51 -0800 (PST)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Mon, 4 Nov 2019 13:39:41 +0800
Message-ID: <CAARXrtnas2R+cbdRmUOwDtibt17h=WTBNxvfPue5NVYuAD31Zg@mail.gmail.com>
Subject: Issue found during installing systemd unit from repo
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 George Liu <liuxiwei1013@gmail.com>
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

This email is to introduce an issue found by George Liu that the
systemd unit variables are not correctly replaced by the value when
installing from the repo.

For details please refer to https://github.com/openbmc/openbmc/issues/3627

The question here is, should we fix the systemd units themselves in
the repo, or should we try to figure out how to install the services
*correctly* in bitbake?

Be noted that the issue impacts the below service for
meta-witherspoon, but it's not clear if there are other services
impacted for other machines.
* phosphor-gpio-monitor@.service
* phosphor-gpio-presence@.service
* power-supply-monitor@.service

@Brad Bishop your inputs are appreciated.

Thanks!
