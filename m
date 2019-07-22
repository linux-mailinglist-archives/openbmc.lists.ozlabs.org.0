Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5823470C91
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 00:29:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sx9Y5M0NzDqWm
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 08:29:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="T/D1WU7I"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sx911MDLzDqPg
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 08:28:52 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id l21so18335721pgm.3
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 15:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fYEfR3ReHJPZKhAkttp1NroLba1lgRRrVCFrvjrHH84=;
 b=T/D1WU7IZlTlmd0EVfD8iUA74jvS81JR6wIEM1GOgMd662w7OFa9kAR2S5aXciXSHL
 b6Raxv26k3CbDTsKeouGfPZ61bB23IrSCZwjkmD9/kRmuNN5XfUPeOmaxKzfXfQZCY5f
 z27UrXysJYHmY7hqofdrciIrIzYo5u3tKFfIci4wv1BbdpFZRG2yFhezJZdXTFAGJNF7
 +zHjq0AdiHMGh4J74ErTQ5VWezfDGOt9DmcSk//QzzIr1eU5dqSK2139kYyV9zG0FKR4
 DbS5eh+lrhkTgSzLuvur8pj9cVqg3Mkr8ZdWq+Ym+7A/xOue6dXBZW7mDmnuGQHH6Duz
 /f6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fYEfR3ReHJPZKhAkttp1NroLba1lgRRrVCFrvjrHH84=;
 b=su/jWQnhbJ8EJRGyoLSnTK51DUpMtuaVYTzPrnJ7CbaNA9XveeCXRY+4zAepcKnghJ
 STY5PstbnlwOblhoxYN3IFV0/EPQ+imE2PQPRX4ieCxBfLT9EF5R3pPF5TkyV1qRkfEP
 KFhYgVD/F2HrIK2TYBIavj81Ejb94bN1MjpBvGdq6SLv74MvEJHUz/w9RUdxmHHka04q
 s0zclL+WZ2elG7nXFjXtuMR/k5aRzyyZdiP4uwFO5sB2KUJ8KPXK3EmnGcn2RbxcwFFO
 B2YJiBZs1w0ctGauLt1ZkaHJNxzoml+ju45qP/J1DR/Gd7bBLaqNbKzNoEUPU/uOzYsb
 E/Yw==
X-Gm-Message-State: APjAAAWQ1JODuSFhIoo7KTh9Qr+M8+y8CXWgLwqeYbR2iw/o7PPads1r
 6QwfIo/J5ucKyXDVw6is/K80/yDMC/0kPy2v1dpvHw==
X-Google-Smtp-Source: APXvYqwgPCb0LBuqhPobcUzgJ+O9Ip5yBXLWS3FqbDoohOjQSBAIzTThhb159pJzGAZ+n/+I6aaIcSMPhPytU00iL0c=
X-Received: by 2002:a63:2784:: with SMTP id n126mr71084748pgn.92.1563834529360; 
 Mon, 22 Jul 2019 15:28:49 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 22 Jul 2019 15:28:38 -0700
Message-ID: <CAO=notzV0DFQ80fPP=z96RxK7WBwUYZzEG__Qdo7-mAzJRjwWg@mail.gmail.com>
Subject: Dynamic Configuration of phosphor-host-ipmid sensors
To: James Feist <james.feist@linux.intel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, 
 tomjoseph@in.ibm.com, Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Emily Shaffer <emilyshaffer@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I was curious if anyone has patches to do either:
1) configure phosphor-host-ipmid's sensor list with json; or
2) configure phosphor-host-ipmid's sensor list with entity-manager,
s.t. it builds the SDRs from the Configuration namespace?

Is there a preference along this path because we're going to need to
move to dynamically configured sensors for phosphor-host-ipmid?

Patrick
