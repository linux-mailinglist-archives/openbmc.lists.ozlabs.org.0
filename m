Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E333DCE93
	for <lists+openbmc@lfdr.de>; Mon,  2 Aug 2021 03:59:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdLm44z3wz30C4
	for <lists+openbmc@lfdr.de>; Mon,  2 Aug 2021 11:59:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=C8E8tSS0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C8E8tSS0; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdLln2lSSz2xvG
 for <openbmc@lists.ozlabs.org>; Mon,  2 Aug 2021 11:59:16 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id db14so8201245qvb.10
 for <openbmc@lists.ozlabs.org>; Sun, 01 Aug 2021 18:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=powjJoG5GkAREIbfdk9Jh/VbZ4zon034RH+iA4k+aCk=;
 b=C8E8tSS0fWYoDNT7Q92xVx+MFt5wrW3SNVKoSpou7qnlC02LXR0+fTwdCZ9Ov7Qvb9
 TE9Jgbf37ExzLELWNLcE0yAUtysmaVp4slEXXpLIZnCgezW6nebYzSiarfgJY40J+h5V
 t0ZEAbvu/xdRfM3vMZC4vlUjqn6grQU9LXtA9FZhX3bktvU36VzBzh3vSpBdSYqI6Xe4
 GPFSrmXO01yi5AK8uyQ0NwAcU5rwh8W0CHgXvMtCmuYSh9j1bx5lrjribPsL8XKn1Qm7
 /wtidfeHFVwHs6vPLrLw1dw4SwT8vJwHlLL7uoWzaqA7O4dVgRCJUghvVtn1tQXHZ3w9
 yrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=powjJoG5GkAREIbfdk9Jh/VbZ4zon034RH+iA4k+aCk=;
 b=XlRuV9HssyG1xdw0c58+9UiXrJw9GqGUXr90widZ0xpch5U4vY5v7eZF7OpTwclSJb
 V+ccXDyZkFyAqCmxDbX8PvYYsi0n90PSIsKNdiBNwROmXToUOSt3a/HmhLq4Mz4LKv0w
 hFt+jzDcJrcnyRbR3BIir4XHiiSWqeOGhZFv81ngPdPZA40naZ/he6/sHUmBTkx0Bvkr
 2OvAB7Idk8Vv/CvdtYoDYLommODtUS6cZVPJ+acKjVnIL+tUi8fbVm7VZ9IFgx4IeHCz
 hdL5q08uk8Qb0Bx43o5VHLWShTfaGpxkf28Dqk3PAuzMEZMI+WgJDAmMC2s6U+zWy31Q
 DzOA==
X-Gm-Message-State: AOAM530z7+JQh3dMLX4WMP5e14JL9O593AMBRn8a9BUOuqfVxOlxZSvH
 jOSt+faQS1qlU6BsLI6QPp65+/QdfEWLGHo562iKPcZWLjEgeA==
X-Google-Smtp-Source: ABdhPJymKMBuDVqQlzNGiTkFp458uWZSnfNTAjdpHGXDug3XR4MNCGxoWYv2GQgbdV2n92liyudWNLbjqGm2OfJx9Vg=
X-Received: by 2002:a0c:be85:: with SMTP id n5mr14085525qvi.59.1627869552551; 
 Sun, 01 Aug 2021 18:59:12 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Mon, 2 Aug 2021 09:59:01 +0800
Message-ID: <CANFuQ7DfNJvabRkwttA4G08GO-EZnH57JSeBXnMLz_S7=KOXiA@mail.gmail.com>
Subject: Spelling errors in environment variables of meta-security
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, akuster808@gmail.com
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

Hey Armin Kuster:
  When I wanted to eliminate the alarm message by disabling
SKIP_META_SECURITY_SANITY_CHECK, I found that the environment variable
in [1] was misspelled, Armin Kuster, can you fix this problem? thanks
so much.

openBMC URL: https://github.com/openbmc/openbmc/blob/master/meta-security/classes/sanity-meta-security.bbclass#L4

[1]: git://git.yoctoproject.org/meta-security(c1235f6affb5c38e64b3a04533b8388969b194b2)
