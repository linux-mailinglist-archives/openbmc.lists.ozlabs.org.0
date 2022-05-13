Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4F52637C
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 16:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L09b806dcz3bfH
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 00:12:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lkzj93NB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lkzj93NB; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L09Zk6CSVz2yHt
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 00:12:28 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id s22so1197158qta.0
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=vGxMBTxapdhSIDfwXQdGfdpJzyEe1ljEDnzJZkjl7BU=;
 b=lkzj93NBOCKM/7rR+sb27BA4bRZADWyvlYDr/6WqNmVL2TMccwq0QjdIbczwBlg5+H
 gWV1QyJx+f8UcIY3ua5TfmhmTYcsdAGTz5ECq3RBV+aXoZ0lj/4FkPhm+DbL76elhlsK
 8USFWN8Sra2eP0xWyIawTHaQVw3qf/4F64lpZEfDmxdUGpLZ/O9ufzblrAv5Sm4NrOYE
 J4wIhMd6mngwSUPmzJLuV9OKfWkc4Wb6a7kEVe26udKgtHCa3cJe9TX4GoWq+ddZc8O9
 17Hd8XKW+OCzgpcxvYtMDKSl4YqUJDMXd1Foq72K+JJmQ6mJSV88WGBp67GMs0SNsRSs
 /s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=vGxMBTxapdhSIDfwXQdGfdpJzyEe1ljEDnzJZkjl7BU=;
 b=oKCfK0S/8xloTMR1q4Au0Zi4Mt5fqhE7lVyqYocJBQCAhF+1R+kfTWIF/rrDJylFQq
 Xz7dqCpv0XWePO6f/N+WhzNFrVFG4nvhIZOODBHHQOvGW13WLf4Qbq/22MESisoc/Q2y
 3j96PmALIKnM3XE2Evd0th8j23lpc2buG5PqnANuI/ZKvNhujok4Uehwq+0qJL1O4pC1
 qEYBsIPaqmx86Wf8sj6X1kcC3v5ePauShYT2B1cMqij3ujDLaucCgCWUo7uH6qT9mnZP
 m3Bc0rq2Bu4s1BOE0olpQai5Cg21zn5skVz5XVi0S+PB3peXVh38CeSkW11pm9589dce
 A3oA==
X-Gm-Message-State: AOAM530K4U8MgrmuzBohG8hJI8FNYbqVexFCr8l1ZiR16THLP6nXF/33
 PjdeB8+WjASFfKiQaeliusNRNZmlk2ar2w==
X-Google-Smtp-Source: ABdhPJxUREucgJLHzIrIvkXtc6LYh+snIQZfPQooEKUSFLlD2YqoGWIc2ghN1EX355NL+28I6ymecQ==
X-Received: by 2002:a05:622a:199e:b0:2f3:cd8c:28ed with SMTP id
 u30-20020a05622a199e00b002f3cd8c28edmr4693255qtc.656.1652451144688; 
 Fri, 13 May 2022 07:12:24 -0700 (PDT)
Received: from smtpclient.apple (wsip-70-184-161-145.hr.hr.cox.net.
 [70.184.161.145]) by smtp.gmail.com with ESMTPSA id
 12-20020a05620a06cc00b0069fc13ce24fsm1383988qky.128.2022.05.13.07.12.23
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 May 2022 07:12:24 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Gerrit and Jenkins server transition May 20th
Message-Id: <E6809659-C4B1-45FF-A19A-3DF59B598F2D@gmail.com>
Date: Fri, 13 May 2022 10:12:22 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Greetings,

The current gerrit/jenkins/opengrok software is running on a bare metal =
server
which is reaching end of life (it was a great ~5 years).

A new server has already been created and some basic testing has passed.
My tentative plan is to take gerrit/jenkins/opengrok offline next =
Friday,
May 20th, to do the swap to the new server. This would start around
8:00am US Central time.

As with all of these types of events, I have no idea how long it=E2=80=99s=
 going
to take :)  So plan on no access Fri-Sun.

I=E2=80=99ll send up a follow up email as we get closer and keep the =
Infrastructure
channel in discord updated.

Andrew=
