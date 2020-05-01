Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5263E1C0B2C
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 02:07:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CsyB4YkfzDrK4
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 10:07:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ENE/kWuc; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CsxP3lPMzDr9N
 for <openbmc@lists.ozlabs.org>; Fri,  1 May 2020 10:06:48 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id z25so1263670otq.13
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wubc18Ukh8g2Qqq9sJRUSy/kt/3cadZtCRM+byOaRGs=;
 b=ENE/kWucm3bL6CqTVFIiDi9pMuWSHqellK+3UFpqiwuq5Vns7pICkjMMOLPf0vdive
 9D9izxzuHEroHAlz17stH1bYfS8QWjPGQPm8fASC/KnPOfaNXcLCOq1SFPV25JhLTV7d
 7lbe2nWcFqq17f8YhmTCyjWrlaCKTgWDONHgBTFSVnrpfNzsP74vEEy+6/VU0xG3qqMa
 hHL1wTE2PIOJvQvbmfff9sAzmLQPGiL/oK3o+aSyLfK3pXCzZeEFDl+JakFbCm9NviA+
 vO1Ds12aSGtA0zpymmdYjM6oFFfh/4DF3sVvET05K4Hoj8ANw0hgs6HhlRLSpOcV8CMY
 e7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wubc18Ukh8g2Qqq9sJRUSy/kt/3cadZtCRM+byOaRGs=;
 b=so3EQmaWqXBKD6Eyp5sFKGoHsO9XFgJ7jW2jt0amYsuF5GmvE104NJMK36IE4IPB3Z
 VP97VwJG0JNmWefo3IE5U0/q42jwJxV2Vz5pVM65qfEDSuhb3RRJrKrzC0tynfB/DVny
 H2XZZvLGsY9mWK3zoKjGIHXfdw67KK05IIRFUtnTsosIFEczbLH+WLc+kGulCy5qnPSr
 9maN2wB89uAS15NvZS6sd5GvUi0Qn2eW/fZMsdMkmyhfaTsD7BptdQjnVTzbcv/GI1Ac
 MovSmLLCURaR8iocmP3Q9RhV91mRNRsASt3Z5sHCuhiHyGUSv9QOwB1ECLXIxHG1KYcr
 GThQ==
X-Gm-Message-State: AGi0PubJfoSXMk0xq/rpVIHmwW25ZthhBJo0IXlndbZ0xGvWpCPk4CjF
 CMC6almvjNHn9UP4Vm6ftSh7jf5Pc14aAqWE0cs124eVhEk=
X-Google-Smtp-Source: APiQypIzsze6OS5icotsHDVKac7j74yiH22Y8w44cOR7SuZA30SJz0e65ZKqoNRYo1Tvjwg0wyfMYXhEG1MxHcX39yY=
X-Received: by 2002:a05:6830:1098:: with SMTP id
 y24mr1501815oto.222.1588291605747; 
 Thu, 30 Apr 2020 17:06:45 -0700 (PDT)
MIME-Version: 1.0
From: Zhenfei Tai <ztai@google.com>
Date: Thu, 30 Apr 2020 17:06:34 -0700
Message-ID: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
Subject: [bmcweb] mTLS client authentication always succeeds
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f69e8d05a48af4ec"
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

--000000000000f69e8d05a48af4ec
Content-Type: text/plain; charset="UTF-8"

Hi,

I've been testing bmcweb mTLS for a while and found the user defined verify
callback function returns true in all cases. (
https://github.com/openbmc/bmcweb/blob/master/http/http_connection.h#L287)

If client authentication is enabled in bmcweb, should it reject if client
certificate is bad?

Thanks,
Zhenfei

--000000000000f69e8d05a48af4ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;ve been testing bmcweb mTLS f=
or a while and found the user defined verify callback function returns true=
 in all cases. (<a href=3D"https://github.com/openbmc/bmcweb/blob/master/ht=
tp/http_connection.h#L287">https://github.com/openbmc/bmcweb/blob/master/ht=
tp/http_connection.h#L287</a>)</div><div><br></div><div>If client authentic=
ation is enabled in bmcweb, should it reject if client certificate is bad?=
=C2=A0</div><div><br></div><div>Thanks,</div><div>Zhenfei</div></div>

--000000000000f69e8d05a48af4ec--
