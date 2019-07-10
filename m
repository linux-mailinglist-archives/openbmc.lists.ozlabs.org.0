Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A119864ACD
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 18:36:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kPvr3020zDqrC
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 02:36:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ij50Kd7l"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kPvD5pCxzDqjx
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 02:35:52 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id d17so2777694oth.5
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8OU4Avz6ZBsMlbLgePCis+KR0Qjm90dFGFIFU62Xbjc=;
 b=ij50Kd7lNRfjyfOZHJ9KHrmKV4FWZld2qpfjHBP8d/3yjr28TF+e+0a4UeztgOfPR/
 fqhpr06tBIsiMrMeRbWT4RhAqCCZ3hSPyscJrTneTS8f3MeNXYubQC8hYL5os6ayzo6E
 bSsSWu5RXh9b6/PKf/afc//IHHKqIEdk+qNIpoo9MzUXsMl7bNf7kK3VZ4l5cdb4nLV4
 ye32kEA2+Eo9di7t/A8mQ14ISvh0Z6MtlmRtAbWiGPLNig/cxpPPzAcV8QN2gmsxC03q
 oGSr8ld8m+6ijf21Ghzi5gPcglUt2i3nLAxYadQdPxRoRAHQJlK9uI88VIAujWcOq9Om
 aFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8OU4Avz6ZBsMlbLgePCis+KR0Qjm90dFGFIFU62Xbjc=;
 b=Z9Eqhqt3bt80IpC/zPF7cx5Z0VyFcfS6wkwJL03632lOTLpKp9X5UWeFwuRAU6pX05
 F9s7FqLdjqu/IzN80pEx3gmgY9rHizicffNqbzzLIdvX3ip2R/i46b2JrbzfRzXfZF/+
 3tPfuGlB3FnOz5/gZsDvpV2B8eWeWmkBYJQmGe8GMsR8nxLv+TxPYY5lv8Refnp4ADVP
 5W3ECXkEFoGcCOY3A2I7vKlOwpNZqp83GeVFmjU2pKTI4UJYYG6QIMSk2DzJjc7e/PgO
 OEGzUFSC4f7W/uYZG0T6lvA+J3ZHOztnDxwGznBXYBNoF4nLvYyYCGyPQxRaI+J4JTMq
 e1gw==
X-Gm-Message-State: APjAAAUfi1yCdU4Xs1szlGxrh8lkTFs/QCjAkn9NktLOCZH+SPVxcxo/
 cH6VnHBwEG2/m6+0+4OahDMlFVuxDQFJtHzUZ709NerU
X-Google-Smtp-Source: APXvYqxoo0X8tg87IjsAsZzoZJ8ZbxXObbhh3seuGv9YM2YGcv88clYeqkE7NEL5nThAxu21G1CcUVMVD2RYKXv4GaU=
X-Received: by 2002:a9d:7353:: with SMTP id l19mr24539880otk.296.1562776548822; 
 Wed, 10 Jul 2019 09:35:48 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 10 Jul 2019 11:35:33 -0500
Message-ID: <CALLMt=ocrc_aRHCMDUU8Hmz7sphUjhmgtPyp7-P5Hc_RnzYXzQ@mail.gmail.com>
Subject: Infrastructure Meeting Cancelled Today
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

Not much to discuss since our last meeting. All of the jenkins nodes
were upgraded and gerrit was updated to it's latest point release,
2.16.9.

Andrew
