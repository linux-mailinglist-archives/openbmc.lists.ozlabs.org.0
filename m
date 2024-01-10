Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71019829281
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 03:49:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Xmb5RDua;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8shW4Jr9z3bZN
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 13:49:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Xmb5RDua;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8sgw2Jzlz30N8
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 13:48:58 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3bc1414b48eso4100208b6e.2
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jan 2024 18:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1704854934; x=1705459734; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xcYOhTQs1EtabCef2QXC536heBn9IOXbaoMjkApu0wI=;
        b=Xmb5RDuaXuKC0ReqXQVEGbdq9fbpYCjCiWrrmlDcGWNctElWa+gOSHWZH8SlLht+We
         rdBYkF8zYJ8u8p/1a9tyao8doCeGkyoaj0xGaecDrDpxdlMCGg6gaPXH/DstwR1Xgour
         Z/1VIZsZ3ppwvABTjw6OCJR8+pxsHUTLn02zNd5RvWx3s8iu26EM5k1XmSJ3i3Uy5AMv
         wKb12ktmnDR5PlscOBwSoVn9pQ2TkL5tuKzbD6KOCyyucFwsA7QQ9qRkknnMeGFA35RT
         O5pdaHKAWTC8g4CSXZUCH+/lDzuIscblyfGisO5/zH9ya2vBjegJ1HHaMhG5kspfntYD
         ywJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704854934; x=1705459734;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcYOhTQs1EtabCef2QXC536heBn9IOXbaoMjkApu0wI=;
        b=HSgxlppGIDp45rKi2H388YjOrQr4zoSkdC4UXKxzAf4yS48Pq9soJAP5RO9DbwO6o2
         q7K4LItv3N26+o2IWrRghxbHS5gxv8xFNpPYvbgE7JsPuYMihPm8iGqy3Np2xnp+Nab+
         KCLGNsw/6JVgM1MOZig62L5jWlCSIjuGj84EFhecs/ReT/aH49hE9ix8PfFHZiDGJk8K
         q9ZMKZQfdj7Qa6VC9dONOaggkJzUDkgcDA6/9E5Li/2YV2cOfNvG2L1IjfPtqfiMg00a
         pVHzi426nhva7gcXcYyyuBOsyA4Gz6lAoQB2cbJ38MgAOYEFefzAhTYW7TLd7vYDfrKp
         8KQw==
X-Gm-Message-State: AOJu0Yy46DTtYnygqEBzd8SDP1Njk+SlbqdRu+iSg/Si1z8jXLl4zJ4o
	n9/dxD3jnUwJa+iSJNbED6CE2UGvSuFc2XLtQNTfw+n5woSE0pauF+WlQKmMmpY=
X-Google-Smtp-Source: AGHT+IGhGl35s6FDpzcPdsox8lE/0CZG1laRUT0NMckWL3RhQaQgZuDFfMaJAW6iHDgL6+xpRNLVe0xyz8msO6CVcTQ=
X-Received: by 2002:a05:6808:23c6:b0:3bc:7171:b7c7 with SMTP id
 bq6-20020a05680823c600b003bc7171b7c7mr574148oib.67.1704854933886; Tue, 09 Jan
 2024 18:48:53 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 10 Jan 2024 10:48:46 +0800
Message-ID: <CAGm54UHeY-gg_otQ_UOTLCqO52cqsooTkvW6VBHpmOWyCPSuxQ@mail.gmail.com>
Subject: Potential impact with bmcweb pam config change
To: openbmc <openbmc@lists.ozlabs.org>
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

This email describes a change in bmcweb's pam config file and the
potential impact of the user login.

# Background
See details at https://gerrit.openbmc.org/c/openbmc/bmcweb/+/68562
In short, the previous bmcweb pam config is incorrect, and a user
without the `web/redfish` group could log in to bmcweb.

# Potential impact
With the change, users without the `redfish` group will **NOT** be
able to login to bmcweb anymore.
If an old BMC is upgraded with this change, and if the previous BMC
users were created without the `redfish` group, such users will be
locked out from bmcweb.

# Questions
The questions to discuss:
1. Are there real cases in which BMC users were created without the
`redfish` group?
2. If yes, how to migrate from the old BMC without any accident
lockout, and still enforce the `redfish` group check?

-- 
BRs,
Lei YU
