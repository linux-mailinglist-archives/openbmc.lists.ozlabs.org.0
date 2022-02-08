Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42B4AD07C
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 06:11:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtB2440smz3bVy
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 16:11:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qKCf4QL3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=gpgpgp@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=qKCf4QL3; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtB1f1nWyz2xsc
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 16:11:16 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso1515541pjh.5
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 21:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=IncEpOAIigKzWMXDrEZLGk+2QgIFDxoqCC7bESzRs0Q=;
 b=qKCf4QL35KF4mq4AO5kSMGw0gRW5lR8LFZvw8zw51wm9m7ekPJiieQGyEPkJ75AEUM
 /18jo5Z4bWpX/dv4hiegLeMkbBDcAzWv7/xXEZpBSc6L4IWjdwIWjTZG+TEycSyadXiX
 Ml42kUTtLx5KmjWmHTEwpALHyB9xjjSf3yeGIKIgqS6c04fNSSVNKnuJyCWgn1Ccczo0
 m3wQ92ZuaHTkEIS3bTsiVv+wyhcOohyVXFQMNs1OUS71A5nabnvEgdLCm5ECbyPfppDg
 vZsNug3WvM6FhX+zZLlCjbVv5QKihh1f6EixOq20x1xLMGm9N296pDOezhYvSv3oN13v
 ydDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IncEpOAIigKzWMXDrEZLGk+2QgIFDxoqCC7bESzRs0Q=;
 b=e/Lso20sQCTL4VcYrUpOFTu//+P8aczbJ5mXS5RGkj3SYbKe+RKv4q1PblFpHhPm3O
 Q7cxQoFRX7jljZpmmE985449VeLV0nXLllNDv9eS9+eQUFNXtQyCM8MSnSbkLN5tEtQ2
 I+W7OdSazd9EjEaVglm64yEkph7eGYIuVIdD7xg9Ywy3E6yngW3EKz0xMMwpDwVMCzcF
 f4l/lTAiG5BeCzZcJ49PA2RgOe9N9moacIp1GPCyN6wzIgdOcMXiAYnJwIoEThoeZS14
 R9i3bnA5fc7yJGNczTmo6mRcuee73s8HYlDT42IogtHJeqwY2FlfLJ9+Zm0pgwsPx+p7
 dZrQ==
X-Gm-Message-State: AOAM533Jfr8ThrFxF9cTeHNb7628lz04VZC9prB5jXUku2tiFtelAi9q
 wmuS2lj6JGUDHZXuON7d2f0f0A+tluwC2P2sw9FeadxN3/zLTw==
X-Google-Smtp-Source: ABdhPJwhyK6OaKr9hfQz/8SSSK3Qx8S5cj+2YB+ONXYLwc7ttZfJOBe5mieLWBXr/bBcB3f0vAPjDvGmObNvZH/DLJ0=
X-Received: by 2002:a17:90b:4a09:: with SMTP id
 kk9mr2562355pjb.107.1644297072875; 
 Mon, 07 Feb 2022 21:11:12 -0800 (PST)
MIME-Version: 1.0
From: Michael Shen <gpgpgp@google.com>
Date: Tue, 8 Feb 2022 13:10:37 +0800
Message-ID: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
Subject: Propose a new application for reading DIMM SPD directly
To: openbmc@lists.ozlabs.org
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

Hi Openbmc,

We would like to propose an application that directly reads the DIMM
SPD over HW interface(mostly I2C/I3C).

If I understand correctly, the main method for obtaining the SPD
information in openbmc is from SMBIOS which is prepared by BIOS. And
We are exploring another way that excludes the involvement of BIOS.

The architecture of this application will be similar to the
openbmc/smbios-mdr (the dimm part). The main difference will be the
data source (changed from SMBIOS to SPD).

Currently the code is still being implemented, and we plan to support
DDR5 SPD first, then expand to other DDR generation(if needed).

If this proposal looks good to you, please help to create a repo for
this application.

Best,
Michael
