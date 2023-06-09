Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4172A586
	for <lists+openbmc@lfdr.de>; Fri,  9 Jun 2023 23:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdF5T5vtSz3fFj
	for <lists+openbmc@lfdr.de>; Sat, 10 Jun 2023 07:46:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20221208.gappssmtp.com header.i=@tanous-net.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=It92w8Dm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20221208.gappssmtp.com header.i=@tanous-net.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=It92w8Dm;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdF4s65mcz3f0v
	for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2023 07:45:47 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f78a32266bso22102585e9.3
        for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2023 14:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20221208.gappssmtp.com; s=20221208; t=1686347138; x=1688939138;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+nXOaL/7GMks+k/VQm5mSxbUGQNTZPwcC5hsnifCZvw=;
        b=It92w8DmZdv2ERgKajW/Y2BHGsQJxCkPIJ0PZALdJ14OURHSfDRzmh0Ge+KNKoCzuq
         JLAbo+Typqn9e+oWemHKRa7Ws2U3RfNfjQbZZI8JFn7OlmHyRd+A97eoHHewdKISOhqA
         lUAUtJzmjwE/ihx76q3SfM0Poi1nKZJ1+dAAW/kRUAryx6PPd6TydXZ9iH6igN+ISzTD
         O7x94eSr4pQRUuFIY7B7bg/WzZB3j08wFoVcADyIFWk4TfmOCwA8+XHIMDgxuws2KO7x
         Aq6LsnxlH6PjMpdRL7LGNVOFs/O8Z4ALmo7il5mBkdYknL+9vAQEkKqqtx/PJJHwS6CB
         Ruvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686347138; x=1688939138;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nXOaL/7GMks+k/VQm5mSxbUGQNTZPwcC5hsnifCZvw=;
        b=QP3GLAokFpgjJFssxOMWi5O+JZ9WMbAcxNuSG0ZV+5V/UqCdshnirynbUIcQjJFQlN
         +VxRbQaqMU1sMDYICRfa/j/YRlFoJYZoKBot11S1aX8buN6ZpLAh+lZn2+fmStkoLvnx
         9k3lSnxRzqAC747ISdGdesBzWg9yNa7vXR9b1hn1Yv3BAoOvL3LZxtjLm6BRQabt4eI6
         lUb/nWWAEvFhie1WwMfUATEdUuioM+sWKSsPGt7Xgz7cSMuHYshnqNQmNlPYsRPo6Vok
         a4+w1eiqGzB5xXITT1QjZFDmNJDA2IKchgmWHt82/k+R37RKN4CO7tEiyV1tgu9fcu35
         qYQQ==
X-Gm-Message-State: AC+VfDy8J3jymC9fsLIURKGcp3H9XgkTGozwMFWn3ez1QAHITH8zFOms
	AQhsHTTLSNli2EFOUjTmZuXtdRcK1yaQjMerEOVTqsIVUcMhBLsNLkI=
X-Google-Smtp-Source: ACHHUZ7hDgricJgBecNKOBrXKhhztbGybtrFK5AClCQacQ3LJJt6DMUXGe55TUwzNf4n1tGcsZlsI/F2/7mfzwxx9hc=
X-Received: by 2002:a05:6000:c:b0:307:8718:7891 with SMTP id
 h12-20020a056000000c00b0030787187891mr18783wrx.54.1686347137936; Fri, 09 Jun
 2023 14:45:37 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <ed@tanous.net>
Date: Fri, 9 Jun 2023 14:45:27 -0700
Message-ID: <CACWQX80WU+rurELYqz-Mjo0d5v1aDG9N=WEV9hU4cJ49hnHBtg@mail.gmail.com>
Subject: Changes to content-type handling
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
Cc: Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

TL; DR if you start seeing unexplained 400 errors on POST/PATCH, read further.

A recent bmcweb change will be changing the way Content-Type is
handled by default for incoming requests.

https://gerrit.openbmc.org/c/openbmc/bmcweb/+/64072

While this is technically in line with both the HTTP RFC as well as
the Redfish spec, it is quite possible that clients written and tested
against only OpenBMC might be setting the content-type header
incorrectly, in which bmcweb will now return a 400 error rather than
silently accepting.  This is in line with OWASP guidelines for
webservers.

This behavior is controlled by an meson option flag
"insecure-ignore-content-type" that has been checked in for some time.
If you need to opt out of the behavior for some time to make sure your
clients are brought up to compatibility.  All of the Redfish tools
have been tested, the examples have been updated a while ago, and the
webui works as intended, so for clients following the specification,
this should have no impact.

-Ed
