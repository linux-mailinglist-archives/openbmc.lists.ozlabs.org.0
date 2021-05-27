Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E09DB392F6D
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 15:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrT6N0HxQz2ywx
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 23:23:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qFotKEwj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=saiallforums@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qFotKEwj; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrT6405N5z2xYp
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 23:23:22 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id o8so849144ljp.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fC+go+LPmugjaPL8LBILVmdi1H+BVCnPSX/0FAQ+QhI=;
 b=qFotKEwjb9NDtyBQ86n/EIT1p7Xgp64WRM9LwiGldqpgN9WucLJAkm7gzbiL+TtJO9
 MOwe9BufhMKwxd1xLIiWwVYLrLGdGdzldG6JaNwEkrBCioxXxJtHbf2j7G3sspveoPIc
 1oDJ3mmRY9JgK/d7E2MiuiNkmtc9Vok1LFCXbTR1eSOFUOZiK36RwlWNuCS5e7dc2+Lj
 ymMM/vGnUfG2U+HUcxcczbHYEuDccoityssbi9hUj7rKj5gd+HbDdN55A4v1jCEwnXXp
 i20L/k9KQcbxEQ/545J9RDYYOlkqM5gCgeKlHjrGmK9P6bHIzvqrcxJbLl2iOBNSWF2x
 lPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fC+go+LPmugjaPL8LBILVmdi1H+BVCnPSX/0FAQ+QhI=;
 b=rRV8BymAUmG5jGn6rEfqj10fdngTcPPsegLyVK2stVQCAv7cBH/2b36b9iIpWhc6f1
 U70GQ/DP9NW79FrTuB+jDc9qRStIjAxgF1qFUxxV72UUoJjq1Ee3e7cq7/z2g8vFVYMP
 2XudTqWqOEuLtbtRIRPRxhnObl8qc1F6q6Q+6ea/tO4+IDtA5MhLFGqm8G4n3eauX/tD
 dCSV5V4O4A02Xnlu82L5jxc/WY9b/Zqt8Qq2AVDtg6ldEUmV5m/pz354L9zstAxBN+Y3
 pEJJTBbLp0hv6oMDhM2og+VUhhrrbD3n4tPjDwSUxOe0aHsz8eKC+4QpWcJ/wpmwVS2K
 t1Fg==
X-Gm-Message-State: AOAM532U5OdMxDFE6pM8xDpNNWV8SShGilcIa0VC9C33Zt/ajFR6u4oh
 oACzLAL4kxV/OlxKxcOekNTg+ZuElRUiFDGA4mB7ewj0JVQ=
X-Google-Smtp-Source: ABdhPJyehq5UQoaYaWFdCqjgg+9dW0a2AtQSaHpvVJPP6a3GX3ABHX+v3g/th/qW/61Q1JU2UE70pZ86Fn3XBpDeerA=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr2659711lja.47.1622121796547; 
 Thu, 27 May 2021 06:23:16 -0700 (PDT)
MIME-Version: 1.0
From: sainath grandhi <saiallforums@gmail.com>
Date: Thu, 27 May 2021 06:23:05 -0700
Message-ID: <CABqzqi4kV_zd1Wkm8vn_qdf5VGrnedvec3FtfE3GModQH5TuaA@mail.gmail.com>
Subject: Using VFIO vs. developing a kernel module
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

Hello,
Our project has an FPGA connected to BMC as a PCIe endpoint. This
endpoint provides a set of registers via MMIO and an interrupt for
notifying completion of work. This endpoint also implements AER
capability.

We have two options to enable this endpoint.
1) Write a new kernel module with a character device interface for
user-space interaction.
2) Use VFIO infrastructure provided by Linux and write an user-space
application.

I am reaching out to the community to check if there is any
recommended option, using VFIO vs. implementing a new kernel module,
or any previous experiences weighing in one option over the other.

A quick grep on https://github.com/openbmc/openbmc with CONFIG_VFIO
does not return any default configs using it.

Please advise.
