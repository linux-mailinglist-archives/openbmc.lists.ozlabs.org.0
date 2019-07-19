Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CE6E9C7
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 19:06:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qy8F3DCpzDqc9
	for <lists+openbmc@lfdr.de>; Sat, 20 Jul 2019 03:06:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rg3dqWWX"; 
 dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qxtd4gXXzDqvK
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jul 2019 02:54:33 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id c73so14424410pfb.13
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=igvYnE7irMAGYIlorUjCcawdkQsS2cjiN6X5HPkNW/Q=;
 b=rg3dqWWXUuiJI5ZHi8K98O82PTD0oP+qOXAk88hBHHkA6WXefY+CqGXJVXD9ZIWAT4
 2ZjO9d2MS/uls5jtcrqiz9x5RbqmwBIGrg9Yk57SM2Dqp8xUjfe5pFPw7dW03kmtyYDs
 BWaWVYhhB/eUwGJcnWWwvL725pN1iR7pNmf1r0TH9uqoB/Ez3ZjTzXY2Zoi8OrBEPPPh
 qANqSv1nN4UnoObYAoCD0/GtG4pyYxn9LwPnRRCMtFZLGdnxeb31RyMhrlHFew9Ns2T4
 Ngqalm1e6xjICRjxAkWE4hh2UuTGsLidNR3fzuAPjVEvD/FnyrwEGJz2OQL4FcG0huWp
 sRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=igvYnE7irMAGYIlorUjCcawdkQsS2cjiN6X5HPkNW/Q=;
 b=os/4P3XpltgbkVNn9hSZ0MjraAtlKJgvRfWpc+My22toiaw767BwxstFw2adUhfzWA
 6bBPV1ZuuCq50JGWv0QQ0jo9IBC0l+42TiK7MNdHG338xU4rv6LhiUdquuLxdMRzQTK3
 XdYF7lNpS1BP+l72Ru0qjRTIoULqN5smukTeHtKtqQkLmgOwhvIdMtu0HwjJrePoJ2lQ
 3MSrZXfMSppcUdxbLx4kWHDiFhTKnrvgfDs+MHbw8qmvgkPPGKY0vU1Rs0OlNzjFoj4U
 u3RttM1o4r80tn4VC2C1O2mwcRZY0D8oq7MZfsvAmJsLqUkGnT7kp1GVIkows9ocJL+Q
 7Kfw==
X-Gm-Message-State: APjAAAXV5ihH2zTGksXwMRsBPDoA2Wj6CxzvluO+h48CVMRUWRLsLpgZ
 Pl7V+vtUTAWY2A4gODp5m8/04IvFCUOEqnXc+O+ci682jotpFQ==
X-Google-Smtp-Source: APXvYqx2UHPbgtd41R6LrDcJ+5Azt7/Zo5zBDGybXsWA5Trino/gX7IPRqPUp44NxTEky2nFlfARx1JuuETNgdF4NdQ=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr54510442pgf.353.1563555269421; 
 Fri, 19 Jul 2019 09:54:29 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 19 Jul 2019 09:54:18 -0700
Message-ID: <CAO=noty6SfCsuodRN7rZ1KA1L=MtJkAq7DibZVt=n05kXrQ_QQ@mail.gmail.com>
Subject: moving phosphor-host-ipmid: entity config to json
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Emily Shaffer <emilyshaffer@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 tomjoseph@in.ibm.com, Ofer Yehielli <ofery@google.com>
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

Currently the entity-configuration is in yaml and compiled in.  We're
the only ones using this downstream, as far as I can tell.  I'd like
to move it to json and make it part of the phosphor-ipmi-config
bucket.

This entity config:
https://github.com/openbmc/meta-phosphor/blob/master/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb#L106

Used:
https://github.com/openbmc/phosphor-host-ipmid/blob/f442e119aed2dc87f320bf230ad39e7dc5c72524/sensorhandler.cpp#L29

The format will be similar.

Any objections?  We're working on bringing up a system where things
will need to be determined at run-time and new json files spat out --
basically.  And this will be one of those files.

Patrick
