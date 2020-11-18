Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 673502B8653
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 22:12:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbwWT4ZZ7zDqCX
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 08:12:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=m4aFFhDo; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbwVT2V5QzDqZb
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 08:11:58 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id d9so3309212qke.8
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sMubbqtzklu0rPsoXEYSdL4wGWvvKiPgi1hVi48wG3s=;
 b=m4aFFhDoX2nmvVO6CvW324oaO+EC9AM0XujoGBIhzC5++AHxXZG8hP386D3Xvn0gxe
 tseOM5fFPXh4jld7eI6RTU+UDlQxX7EmWaCJXbYh6jYX+SgsWJLGfeDqyW3F4OP9OU2g
 oWhDhdkolfE18SxUM+5PDuFNLFvB8Z6geaem6JMOBjnBpPOP+XZrjbq7p15F60neB8gz
 hz6NpsqF0cf/mCx6tDmxEqFxWi9qhrE/bSgF1v7QEdwpMVWqwNqmfvEx33h7yUANcbdU
 awtbeXCSdM9lO74cExlHDJ99KwGvLVx9cIQfkqmbMjXLZSKmjc4uL9CltoiDO+Rf/5dt
 k3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sMubbqtzklu0rPsoXEYSdL4wGWvvKiPgi1hVi48wG3s=;
 b=bidvi+V9VfOQKxA1nwnazJvpljyJ/lG6vrfUZUbVpOhrWM2Xfb4sPED8/zbRbOEx/8
 qhWfyx6WJm1Lsvk5DDvhL2w+JL59MwfqTjJOfynUk/ifB/o/LKi7twsxEMCf+HM9hoBp
 JcWBFUtoher2HWQacN26VVKGPXTF+V1ijvPX/qSG2n4SHbjvsE7bpqyiLjnwi998e/JJ
 63zTpzfwVHHuezRCXjx1RM4oO2QOb+C/WEfTOQAVheD6MVYS5kACqwLmbgk6EA8hsxGZ
 jR+JN8nlDnFix8r2ID4ajtdsLFyiNVExm3fYgm+Z5uHe0twLPWdXaj/b/ZdurFLAbxfa
 5niQ==
X-Gm-Message-State: AOAM532Yz2r6pbdH7mIbFVhSP6U0J7sRcF8F3O0s8VhF9Ui0VvY4bbD/
 p1JlMwpgpHozXFrpxAS1V7SrC5uAbXDsY7VBWb7tJvwGEUSmmg==
X-Google-Smtp-Source: ABdhPJz7f1YdC7dmOw5HgWkSHrb3rPLxpwehDeR/9knsQpal+++eAj3gWtvfk0ijAUKTHf4Fz8iEhOY1TD6JYaQODLY=
X-Received: by 2002:a37:7685:: with SMTP id r127mr6746902qkc.261.1605733913814; 
 Wed, 18 Nov 2020 13:11:53 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 18 Nov 2020 13:11:42 -0800
Message-ID: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
Subject: qemu for bmc
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Patrick;

I was looking at a patch series of yours that landed,
https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
this line you're referencing a device that appears to be missing from
qemu - namely, the pca i2c mux.

My question is to the community at large, and you also, is anyone
currently implementing this i2c-mux or a similar one?

Thanks,
Patrick
