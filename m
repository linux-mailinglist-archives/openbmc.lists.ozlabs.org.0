Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF293BBC1A
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 21:14:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cYs337JtzDqH2
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 05:13:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sAWZlc2S"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cYm43YqGzDqJH
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 05:09:39 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id c10so13116798otd.9
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=A6JOD64EMQ32iBKh+t3IdbLTNJiQ71DX5H1eqK/7Ju0=;
 b=sAWZlc2S3MqY+rXbnsaSg/cwW2gihJe2QWV3k+mPIg/aVMOM0U3WfDM9OwmrZpDb3k
 OMveBSE0C0frxsELXiEmJ20d/TAVKoabOZNHN70GWHL6hCS30YCbBL5du1Buw674hhFl
 5DcbWf60ydbkHWD46EKp118uKNYCGuFXni1ogsOxJw5FKekAA3VtF1YWUwDrAFursYMv
 fcLJxDF71TpexEFiXVw/dNB07v7ATn20AvuMIEMDjVtMLIIfVUO6K0ctMWTQtvW7547m
 v4FFuQjDZPdcppIqRvKTi9IB/Gdr4Lvdm147Mk/HaqHMVAEiOCA6X98L82RGU2dz3rs5
 X/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A6JOD64EMQ32iBKh+t3IdbLTNJiQ71DX5H1eqK/7Ju0=;
 b=t9TEq193Hfio+Rq7nje5Xc5zlcM8pgAl0LKY9zA1xGZlPKGHohFof78l+URxrMpmRD
 OvszG8acFrZPSzKAMESFrJxzr0/8l8t3XVyznsWl2INtOS+h3lK20ubMzM8BDuKadv9A
 q6zVmQ1o/B5qaLg0nGOjRqMSGTDp+qYNMUg/Cc0FN2nnUf/9msq/9SEX1SmIqihcpX7a
 kxTn2uS3eXzCnY8kCRrK65VhO9P+YnpL1vO/vw4S6UUMmFu+bOhBI/fi75TtzKiETC/x
 ekxPM1khHVKTZkT6ru+972ilV7MeJPLVCr693GBWeUiVciTWsATkHy07IDuqKAPGnAMD
 SMTg==
X-Gm-Message-State: APjAAAUj3uhwY9VS/oSTK5cDfCT6cRdaPlDY3VmU+54qzUNniNSzRB/L
 zB4UOUE9DP9i0ivbk/uvwHz9eJtJbQclu0SPZEL9iTFXodQ=
X-Google-Smtp-Source: APXvYqwGGbSKZudJ8Qd7A2yDBRLdrGQPBLr6xCDfIqXJ6u42O0XKja5yvIYBOd8nq+opfpBXnrebWQiunQF049Y6kkg=
X-Received: by 2002:a9d:4e02:: with SMTP id p2mr1263109otf.260.1569265775009; 
 Mon, 23 Sep 2019 12:09:35 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 23 Sep 2019 14:09:19 -0500
Message-ID: <CALLMt=q-aYR23zsY+unVGYwZ0wC3gcYeG=XfpQK+Pk=Xmm9nVw@mail.gmail.com>
Subject: systemd target monitoring enable
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

systemd target monitoring and error generation is coming soon to phosphor.

The design doc is here:
  https://github.com/openbmc/docs/blob/master/designs/target-fail-monitoring.md

The code implementation series is here:
  https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/24136/

The bitbake commit that will enable it is here:
  https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/24430

The current plan is that if you include bmc-state-mgmt from the
phosphor-state-manager repo then you will get this new function by default.
If you'd rather it be an opt-in then feel free to reply here or on that last
review linked above.

Andrew
