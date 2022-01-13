Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECCD48DFA8
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 22:31:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZd0F3sn8z30LQ
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 08:31:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X2yjcHxW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=X2yjcHxW; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZczt62S1z2xCM
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 08:30:48 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id s9so9607095oib.11
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jan 2022 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=63xeOCeeJClytcbsE2/E6ngezVvhpicx2zmO37zTGlc=;
 b=X2yjcHxWiRrqAOLlzcOXZUoU0nQD2ez7CW5PXt0rf+uWHxQ86hWiiMz3pQbKANTB1Z
 TbDYB3yw8m4lfUvkP08vpfp+YAvKSjPVk3cyLlKuCZDMID5tZWjTjdFIQsvnS0xl7Oue
 Y16VKG2zqmwO7Z1cUnff7tNbKBoHQ4bniX2bJGYxN/svmJWCEr328YbdCEuC02DvIUbm
 +zypFNX/sQVpe8LmG9uuaWnm1qK5GurdWm94oWzVWgxph12iCpKDT6tnjDTuIfFB6O0T
 CSIgjtUkj27ZBqY1pSBRqFr4Ct4H7ilM8nVlPN0lcw9eJGqxaMHHzEkODf7KJWnYSZc8
 /E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=63xeOCeeJClytcbsE2/E6ngezVvhpicx2zmO37zTGlc=;
 b=bNZLQO+73V/AL2QYHCZptvDBxFpw/MYIYHI0YLNZGqUng3EvzLuIBF1z9+I8UJD5fG
 qP2XmV+nt2mxaDDfmsC6ZPZsACCKUTBFbggpb72Ak65FGNIX2sVm4pZ2SAiFAbStarrt
 dDPJU9VZR++Dzr/MvGV0JAta7R+MJjVf1tD4kA7QTUh3aohsSX0PYhUCX3xNzrNbT7t9
 Tijv0ah1fQeDe8v/BaTj96hk7UC3iv+0R0uTWv7fb/StJu8RbqfDACMJeQKVcvhrbGGj
 OBJdp3Nozl0Ol+ZgFzrEZEubBE8Bsp2MLVcN4pW7Zt5yvyiTK+mqLkt2+SJGxkCfPXyo
 9oHg==
X-Gm-Message-State: AOAM531Sr3pIIVDdViEhGE95YhnvCSCLODzjv2JbVbR9dd/aBHJDRK1W
 6qLGR94XDOLWpElp/kdBmVqUA1bi0kg=
X-Google-Smtp-Source: ABdhPJwEfYZxJfK5sZ7sPYmd4s5q16D8d2FXQ+TCEaW4VUj9mY4ajTgmzKzquiKEpfBZnCPW8SdIjg==
X-Received: by 2002:aca:c157:: with SMTP id r84mr5039081oif.71.1642109445271; 
 Thu, 13 Jan 2022 13:30:45 -0800 (PST)
Received: from smtpclient.apple (212.sub-174-198-140.myvzw.com.
 [174.198.140.212])
 by smtp.gmail.com with ESMTPSA id b17sm995136ots.66.2022.01.13.13.30.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 13:30:45 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 13 Jan 2022 14:30:43 -0700
Subject: Sanitycheck problem
Message-Id: <BEA6AAA9-904A-40D7-B114-A9229B38F0DE@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: iPad Mail (19C56)
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

Hi,

If i bitbske -c devshell dbus-sensors, them meson build, sanitycheck.exe fai=
ls with a exec for at error.

Is there a workaround?

The goal is to modify code and compile without bitbaking.

If there is better solution, let me know.

Mike

Sent from my iPad=
