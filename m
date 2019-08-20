Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA1964D9
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 17:44:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CZpc2pZXzDrBp
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 01:44:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uChRnSN9"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CZnH3VbjzDr0L
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 01:42:58 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d85so3628195pfd.2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5GEftX0c2nKkKUOvgR5ZrgzuMMaNeRfz+3hVe6kSK0M=;
 b=uChRnSN9qpMBGm+MY4/vUE9QTm9CYjfqjNqlcZsAFc0YHtI30+vA/pKK/79C20raXm
 gSWZaWR8CBtDi1HgHTFrOAx/6RQzDmY3aaLvpjsqX356qxEuhg4JbQ4sycXhU8DEOsx6
 qKqxHaQu6i65oGKDT+QTdg96aj2EHiRJV6T5N6rfPg2Eqs2pjqJ6RyCZxzkd2TWWFLtY
 e9ImVoUQgLYLsjI5pJfI+RbRhFgmIv3A/R1DalCyB1MDEiEIuBVn8tc2UedgzhfWyLXr
 YAeY9wWAfyU1cbkW6HEEJye/L0MYRzrAztWuxr33ufo9X2fA+jcd8Kj/8JUtDCoYo+Oe
 2lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5GEftX0c2nKkKUOvgR5ZrgzuMMaNeRfz+3hVe6kSK0M=;
 b=oE2jkIbqq0lNWnm5p3NN/MwqpmwcLdp/BvQolB1JSV97kBzeSaDfpM7+mOemZQUWyL
 rqG//IEuA5lWkJTHm0mcbmG3nv1YRKQ5x77/BPpUP3Y67hSajQJwYr5MHDdQ1Y5BrH5x
 Q1tD7d3coYeV3gfUu0+hDfdjrQF19t04wj57anHe9urYdNXJqD5M1Q7IIazrFMK9EXru
 q/fsBTBilfV+2lZMwv9OACA5+LWFwhNITjcUMulpSe/mg4zI+vpJC9VKPxVrFRVd129k
 wfw7REE33wVd7CWIKnrevnldUYgSwqf1Wktb84f0Fb0lu9plpa5EcsmfJ5Ep4AX+Qe9N
 3ORQ==
X-Gm-Message-State: APjAAAXM/P2KfC1wJHm6BJX8XWB99yS5lFVI0DJb6jJtSNPTvnEJH0tX
 0/dRMv6sIctwqxg+Wn0z9QUhf1HIQPpsiJJvxQM1Y7arpiMmbA==
X-Google-Smtp-Source: APXvYqxsvj56Gg3WLOMdSvKZt/pjy++NXBfVee+fsxPK6TcwT1bcVSiGHC4x1xhgte1h1n9W77esr9XgNlj8MwIAMMI=
X-Received: by 2002:a17:90a:d990:: with SMTP id
 d16mr594415pjv.55.1566315774597; 
 Tue, 20 Aug 2019 08:42:54 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 20 Aug 2019 08:42:43 -0700
Message-ID: <CAO=notyg--q9B8_6Z4SrVjjzJEumQtVTSa1XzveRmR04XppFyQ@mail.gmail.com>
Subject: phosphor-host-ipmid entity map moving from YAML to JSON
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

If you provide your own entity YAML file for phosphor-host-ipmid:
https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/entity-example.yaml

Previously, this was done via a virtual provider, but that was dropped
some time ago.  Now you'd replace that file to have the effect.

Well, if you're one of these machines you now will be moving to JSON
at run-time.  There'll be a file to add to phosphor-ipmi-config named:
"entity-map.json"

The schema for the json is similar to the YAML and is documented here:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/24551/scripts/entity-example.md

Nobody upstream is using this -- no system that is merged into
openbmc/openbmc.  I was using it before downstream.  Perhaps others
are too :)

Patrick
