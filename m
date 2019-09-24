Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B58BC09D
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 05:07:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cmML2JFlzDq83
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 13:07:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="brD6/RC3"; 
 dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cmLc3qXjzDq6M
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 13:06:48 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id b128so318423pfa.1
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 20:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZdbcvK5Xj85oiLodFpu0Hf2YjmpcBcGMKI7AwmxdDnI=;
 b=brD6/RC3HBSyPNdyqxvh+IJ+5ZUMUahQznSmpEshw3FNRxvEWDKziF1sW5lJaHSL8x
 Ux1lC+mpkstbu3ITMExaZnhgSvp+iveYg2Nrqt1F+Lx6CBWMG05/SLh2ZNRny7K11dN+
 1NCwpc37tVtSfDULRaUIAoiK59Ck8nDzI/kY11uuM+aV0lcQ8hG1gLXWRX36k0lza+Cc
 1QLkHuNbUQyftRUuiD6v2IDKOwG4uT8xFSHBJYdnc9l9xyJozaCPQYBEXzfBlOd9c3Of
 EAgpClee+d0wheaQlZH1q+qXIX4jPkuPlsAbaP5dXFE4LwUeVSHdu8eA5IxUJVY3o44I
 w8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZdbcvK5Xj85oiLodFpu0Hf2YjmpcBcGMKI7AwmxdDnI=;
 b=tWKTgWyTPd2rTJ3x7j1sEYyMKsoHBXPkxXqYtzrzy4/fvo6baM1niWP0YZC5fyB7Xs
 FFNw4Ac092GMIcDCeyPJPNn+0SQdFNSIKwsSPbHhOo51ydN/SzWKEvEeu2eBukbe12V4
 uddOWIlzrmjt6j59erx2I4cVF9OlBBIYOrItXiD4/dG2viKjwd6l+mxgxgI33Y5AZFj8
 2jKtqOx3YzQbZUqY5geSh5yc42bIo0xmuVSkjRIHBDwYg3wSa13ZTeVUMU/fodrtKA7A
 jNQ/xcEcKZmMEeGfxgHIMHK/fTkDBYcaWF/36ps5pPJKtPRemH1xBHx1P5xJCa73FmY6
 SgJA==
X-Gm-Message-State: APjAAAVm1UJ5cCHjUdQlxucetgVMn8AFfvlOW2s0TlQCEXo2SIuZIv6K
 hwhxQmn/1CRFlf6hjUYIlaGnt52LYLveZ0iaZ+ITbw==
X-Google-Smtp-Source: APXvYqwtV/wz2ML9/qY3dqmdN1YMoEk2+AtGJotM/brcWdljjDbEBcRpk7tkbaONfY+8fWiuRMGDr7bTIt0ZTkiTSFI=
X-Received: by 2002:a17:90a:be13:: with SMTP id
 a19mr434774pjs.55.1569294405351; 
 Mon, 23 Sep 2019 20:06:45 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 23 Sep 2019 20:06:34 -0700
Message-ID: <CAO=notyvvVCNr3GG3fvWkXfUc_NA+ge-KyB7capWGymNBYQb2A@mail.gmail.com>
Subject: MACHINE=s2600wf bitbake obmc-phosphor-image at HEAD fails
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm hitting a build failure with intel-ipmi-oem on this platform.

| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:1849:9:
error: no match for 'operator*' (operand type is
'boost::asio::yield_context' {aka
'boost::asio::basic_yield_context<boost::asio::executor_binder<void
(*)(), boost::asio::executor> >'})
|  1849 |         *(ctx->yield), ec, "xyz.openbmc_project.Settings",
|       |         ^~~~~~~~~~~~~
| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
In function 'int ipmi::getCRConfig(ipmi::Context::ptr, const string&,
ipmi::crConfigVariant&, std::chrono::microseconds)':
| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:1869:9:
error: no match for 'operator*' (operand type is
'boost::asio::yield_context' {aka
'boost::asio::basic_yield_context<boost::asio::executor_binder<void
(*)(), boost::asio::executor> >'})
|  1869 |         *(ctx->yield), ec, "xyz.openbmc_project.Settings",
|       |         ^~~~~~~~~~~~~
| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
In function 'ipmi::RspType<unsigned char, unsigned char>
ipmi::ipmiGetSecurityMode(ipmi::Context::ptr)':
| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2486:9:
error: no match for 'operator*' (operand type is
'boost::asio::yield_context' {aka
'boost::asio::basic_yield_context<boost::asio::executor_binder<void
(*)(), boost::asio::executor> >'})
|  2486 |         *ctx->yield, ec, restricionModeService,
restricionModeBasePath,
|       |         ^~~~~~~~~~~
| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2500:9:
error: no match for 'operator*' (operand type is
'boost::asio::yield_context' {aka
'boost::asio::basic_yield_context<boost::asio::executor_binder<void
(*)(), boost::asio::executor> >'})
|  2500 |         *ctx->yield, ec, specialModeService, specialModeBasePath,
|       |         ^~~~~~~~~~~
| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
In function 'ipmi::RspType<>
ipmi::ipmiSetSecurityMode(ipmi::Context::ptr, uint8_t)':
| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2552:9:
error: no match for 'operator*' (operand type is
'boost::asio::yield_context' {aka
'boost::asio::basic_yield_context<boost::asio::executor_binder<void
(*)(), boost::asio::executor> >'})
|  2552 |         *ctx->yield, ec, restricionModeService,
restricionModeBasePath,
|       |         ^~~~~~~~~~~
| /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2581:9:
error: no match for 'operator*' (operand type is
'boost::asio::yield_context' {aka
'boost::asio::basic_yield_context<boost::asio::executor_binder<void
(*)(), boost::asio::executor> >'})
|  2581 |         *ctx->yield, ec, restricionModeService,
restricionModeBasePath,
|       |         ^~~~~~~~~~~


Patrick
