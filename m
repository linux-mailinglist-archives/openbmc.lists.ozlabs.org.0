Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F7EF347
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 03:11:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Y7k3KGwzF4CX
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 13:11:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qhrGZBNo"; 
 dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Y763mF7zF49b
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 13:11:14 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id r9so83555ilq.10
 for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2019 18:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=a2j4X9fjBXPAmEWw0/jIIi4XvHuLjB6kL8MMnJgW3io=;
 b=qhrGZBNo7ZgvbGFMXUgMnj0yJmQuu2wwPQ3QdlkV40BTjWYBJYaY9oFpDTRbreJjVd
 kXZsViOzzquTe0NelZw111aTYgS/rKbsm8i1jIU5xTk1ifygY0GqBehKsT4iD4itv69S
 d4E4BOkhqCT48BMolT0A0abpT+XOJ0JHEjqi1yoRrjI/pesyPsB1EMo72BDpvLPWZHuU
 WdQ1qIkhSTTn52xnr9XggEESKTzkXXOhafARYSkOFk418dq24f0rIAEezt6JCuMe60Nc
 AhnI8KwfuT9DHlX33EilZlvj9MwAocbDwa1xo5//2YM8acrrgLVYPo3abTddR5+78hLP
 kbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=a2j4X9fjBXPAmEWw0/jIIi4XvHuLjB6kL8MMnJgW3io=;
 b=aqzJlDOAkKAVTS0WtF0C5JC5jYl0kOQFVnWumK+jDSJeFYQbokhMxznewgflU0Eh5Z
 +fxmBh/hE8FCoc79kKKhV7UUd37ZXjVhIBRO347Uk3NEVpoIhtb7+nqhuWoG8j4Bn7lK
 2QGYAGd0yWYckv8maKULKiNS/Lzs+s0fHiaYO2/WBVtM1ZMLNuQNU1ryRN4DsyklROda
 OCdHir/udFee5Yjhl5lExNvc20DVmEIpB+w1EZg6jSql6tYSzusbWk+tmum2ZObkZUQO
 UA7Q6UhBm1XFC27F06vE7ZbIMV7jabdfBRd+5aT/p+pm7M+qCWiNag6N0crwzsWR/98V
 lXrg==
X-Gm-Message-State: APjAAAU7gc8VTnmpbzJWpNDnRz+lqT0tydv9G//6yRGJEEui8MMNz7bf
 GE/noSc94zt9hJOw+ao6TiCiOBNeueV+CFaiCXv0w34odOA=
X-Google-Smtp-Source: APXvYqx3NocsiP3bgwzJY2QV9itoB0cW690RAb5eyt5fVCBe2K5miWMPOBFEI7JnDUkmPYBmnjOmvkMm20njEbt9tEg=
X-Received: by 2002:a92:6910:: with SMTP id e16mr31030163ilc.186.1572919870750; 
 Mon, 04 Nov 2019 18:11:10 -0800 (PST)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Tue, 5 Nov 2019 10:11:00 +0800
Message-ID: <CAARXrtnsZGaK3jZhDZvRUXTXwf_hJOMVpPjJMEdQuBBf6d8b=g@mail.gmail.com>
Subject: local-ci: clang-format hangs in bmcweb sometimes
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

While trying to run local-ci on bmcweb, it's found that the
clang-format hangs sometimes.

Top shows it's consuming 100% CPU on a single core and the memory
consumption is increasing.

Smaple top output:

   PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 99536 leiyu     20   0 97.067g 0.095t  19520 R 100.0 10.8  10:39.18
clang-format-8

You can see it already takes 10 minutes and it consues nearly 100GiB memory.

It does not happen always, and it seems like it's happening when I run
local-ci for a second time.
E.g. the first local-ci runs OK on a clean repo, and the second
local-ci run hits the above issue.

Is that known issue?
