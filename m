Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A677382C9
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 04:37:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KmsS5z0CzDqpR
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 12:37:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="APdOivxa"; 
 dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Kmrx3rlTzDqnw
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2019 12:37:20 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id r18so531768wrm.10
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2019 19:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9l1TytNkDXzKE0fof1Yb2loRfG+JHaN8mbR+fee992I=;
 b=APdOivxaIkKZtIRyuFCeta+HKrYrUKOzUwybo33SxOxKOkQWeF8b/3XxTdF6rx+zVK
 lA2u3C6Qv383WagrjvjLwKy7YF8Hna8u4XQlXtnCYeRuFhhaXOlv7ZzBjptk+8R5j4ug
 s4tzYNGhihRXq2GjxafKi/2sP/fqG4FpubjqntE/bwmTppWQMvyzp+cSoUaOkS7IIFDA
 flf3I4zrdmpSoZ65qM8MzYCkXZ1pQA40jl0VRQQf7PZfdrMXjo9SSxpeUowJGQ2myIgx
 cfpbXYrhl1XRG00oEMH2yNgYYBFhQRPzvtsKmk0KU6SfUPZJJKS0p6/C+73v3pT6KemZ
 4wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9l1TytNkDXzKE0fof1Yb2loRfG+JHaN8mbR+fee992I=;
 b=cz0S7te17cRgR+UT7NFwOVZY8KF7VWltmV4WnilWYuUw2CdbGAsxGFmuFdq8SydECL
 TvBfncU4zP9sXvalhTx3ncBD157Yq5CEYdPvR1TQlGVI63gSEWzCFzhuRxhVMJITdAVC
 eo03HX/uaLafpR0t7i6Yx55HyXzaC1b0tgm6YWlnrmW2g+tkb6nEz1dh8liVfZMsjiY1
 ZRp6Ifb41Q/E/7ZHqMyL/2tx4n5eWod6KttMiPhC1Ge9AEZT1scxyYbwbjrGgq8o6ZoC
 AnB88g2xRRt5tSXP5/Bb/+z3lf5rgxbG6dV+ImRZ98kurxGYdAO4lL88Tq+jRuG+48Ir
 jWkw==
X-Gm-Message-State: APjAAAVKQCEcM+8cB5R6NpsQlHPiIgKq+t5C9WPL+E65PJbKXWOPfuBQ
 /f7QIqc+AYyGOlobx2V2JygVi9dOby6B9nsnF7QZ42NicXM=
X-Google-Smtp-Source: APXvYqz70g7LFvr06gRejK3C+X1ysjpfPyd/4pAJNA8be7gz3nTqgKORsAM0e3Muec2aZzpS6zPUxkMSq09zDDHnO4Y=
X-Received: by 2002:adf:afd5:: with SMTP id y21mr31125903wrd.12.1559875034814; 
 Thu, 06 Jun 2019 19:37:14 -0700 (PDT)
MIME-Version: 1.0
From: Derick <derick.montague@gmail.com>
Date: Thu, 6 Jun 2019 21:37:03 -0500
Message-ID: <CAOUmYFRfVQha0NCZd2aLTc-EC2GNF8wuXqnAyWNMCpzcecQUKw@mail.gmail.com>
Subject: Proposal to replace Clang Format with ESLint and Prettier in
 phosphor-webui
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

Hello,

I propose we replace Clang Format in the phosphor-webui with an ESLint
and Prettier configuration. Clang format handles formatting reasonably
well, but it doesn't offer the ability to help identify potential
errors.

We can run ESLint and Prettier from the command-line and integrate
them into our editors. I have included links to the documentation for
the resources and would like to continue the conversation in the
Gerrit (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22366).

My initial goal was to use the Angular 1 Style Guide's shared eslint
and the ESLint recommended configurations. However, those options
require a considerable amount of effort to update and regression test
to be compliant. For now,  I have added a few Angular and ESLint rules
to the configuration that are categorized either as possible errors or
best practices. If we decide the AngularJS community's suggested best
practices will improve our code base, we can develop a plan to
implement those changes in a phased approach.

- ESLint: https://eslint.org/
- Prettier: https://prettier.io/
- ESLlint Angular Plugin: https://www.npmjs.com/package/eslint-plugin-angular
- Angular 1 Style Guide:
https://github.com/johnpapa/angular-styleguide/tree/master/a1
- Gerrit Review:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22366
