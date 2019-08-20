Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F57996650
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 18:27:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CbmQ6XlRzDrNc
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 02:27:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cRvXJTY/"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cbll5QnSzDqmf
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 02:26:43 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id i30so3686683pfk.9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 09:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=q9S3C/qegMmfmHKn8I31dhNuDTE6beWeU3pgOss5MB0=;
 b=cRvXJTY/YeIM9tDxRQetMjdINqOh1XYt6/vYWBWLMzNXsHv5jfp25kK9UE02XDHGTn
 Q0z6cosfMYGEC8+DtbwjItGhY8OFMnCfJldhVboc3wFGEqQMaShSMvD/3FK59/NzWuHc
 3phTk6qPFOV+BMaLwcTMOx17OyqCSFQi7/zgvJmKm2MMSa+K6tlnjXg00svq/AMKX1tI
 cntsIqGy1j/bILhr0iXJFrhibLpDZdWmVXbJNOFvLyaj/jI1ltyJ7xLCFqBTaZgVxYOX
 gLS/I6rESkcPc/Pn2lYsrQO+h4PrEUNXUeSZDTTsSvFxk0qO0zWuNlphuI7oNoJ590CN
 bQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=q9S3C/qegMmfmHKn8I31dhNuDTE6beWeU3pgOss5MB0=;
 b=aWBYFDexyBVny6FgNrPX2yDSuV6DWqdBjEoi4TQ1eyG/9iMbimtDYtEEwvnsnWGYDR
 Pgv+L0VOHhoOigXDULXmqwdGM+tG2Dbeif82mH2kY1n0l4Jcmw3l2oeXo1LKHpsczQkf
 XQQ3J1oHNnnLi4juG1Eh/bn8wNimCrjF97Icte0Z3Olw/PjnW2mWUnXG/fsNvTmo6j+4
 ZlJSIPSiHFMpjrAVx6yHsTPAmpNqb5NJM9ItNF+7apZizbwCVqexKpt+RJxzbM0gUhRg
 1VU/gDmSNHBBjfnts2WsOMXIPoBS81baTGDl7tENbF7oLHRtGNuYtIUjxsLz2ths5eWu
 ad+A==
X-Gm-Message-State: APjAAAVfpvd972kSMZoHYnDbQvuNbVgWCcGFT7t7ioV+GjHE8wmSxvYk
 n/Q879Pi2ffS66X+meeefe4mQIoX7hBLVdyhtiVKjQ==
X-Google-Smtp-Source: APXvYqxohN4kmKeVefwmxzYGkMwlT78fNdAndn3bUTAk3vImmR5yyfWBItmebnxOf4lQb3t7qP1qvrqZMS66ykAurgg=
X-Received: by 2002:a62:e515:: with SMTP id n21mr31290597pff.186.1566318399478; 
 Tue, 20 Aug 2019 09:26:39 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 20 Aug 2019 09:26:28 -0700
Message-ID: <CAO=notzcsn+0cbEas2npaMk1cT7nv+PeHxy3WWYQnzt3CB_+Pg@mail.gmail.com>
Subject: new dependency: hunter in entity-manager
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A new dependency was added:
 https://github.com/openbmc/entity-manager/blob/master/CMakeLists.txt#L8

My builds are failing because they don't have access to the internet
and this repository is downloaded outside the scope of bitbake (so it
isn't getting cached).

Also, I find the possibility of it going away troubling:
https://github.com/ruslo/hunter/issues/1921

James, is there a hunter bitbake recipe? I didn't see one, but with a
name that generic as a noun, it's possible I just missed it.

Is it only required for unit-tests?  If so, can you fix the cmakelist
to only add it for that build?  If unit-tests are always set to build,
can we add a flag to disable them when built for bitbake?  we do that
for other repos?

Patrick
