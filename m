Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 348CA250F75
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 04:38:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbCpz3wQDzDqQM
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 12:38:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sohu.com (client-ip=123.125.123.56; helo=sohu.com;
 envelope-from=xflyh1230@sohu.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sohu.com header.i=@sohu.com header.a=rsa-sha256
 header.s=mail header.b=BGcmtkum; dkim-atps=neutral
X-Greylist: delayed 1254 seconds by postgrey-1.36 at bilbo;
 Mon, 24 Aug 2020 13:44:06 AEST
Received: from sohu.com (smtp123-56.mail.sohu.com [123.125.123.56])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BZdK216rXzDqHY
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 13:43:55 +1000 (AEST)
Received: from mx201.mail.sohu.com (unknown [10.16.22.121])
 by smtp123-56.mail.sohu.com (Postfix) with ESMTP id 4BZcrf2dlBz262r;
 Mon, 24 Aug 2020 11:22:58 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sohu.com; s=mail;
 t=1598239378; bh=zE5ZbNZ+KBySEj6dKIhL1HLsMK+ok1Vi6zdAL3/QSX8=;
 h=Date:From:Reply-To:To:Cc:Subject:From;
 b=BGcmtkumlZ24pA6/uXDPuwPVcsFrEed3EG/B7pWpsNd3dViBTBv8V3Jw0Xms/dOc1
 tbB/RYyoPvoosnWowxnIUGMH+O7fUzjfY60Khm76vWvRD+6x5XjeOQYYPzUeoUjGe+
 3EAVLw1rRvOHLri/OFeT20wW7zVbVSQtHd4xT+7I=
Received: from dmo-free-mail-backend-g2gm2au3-deploy-866d9bd644-qqvjr (unknown
 [10.16.24.17])
 by mx201.mail.sohu.com (Postfix) with ESMTP id 3AA2F660283;
 Mon, 24 Aug 2020 11:22:58 +0800 (CST)
Date: Mon, 24 Aug 2020 11:22:58 +0800 (CST)
From: "=?UTF-8?Q?CHAPTER_IV_THE_DEMORALIZATION_OF_GIRLS_The_r=3F?=
 =?UTF-8?Q?le_which_a_girl_is_expected_to_play_in_life_is?=
 =?UTF-8?Q?_first_of_all_indicated_to_her_by_her_family_i?=
 =?UTF-8?Q?n_a_series_of_=3Fsthetic-moral_definitions_of_th?=
 =?UTF-8?Q?e_situation._Civilized_societies, _more_especia?= =?UTF-8?Q?lly,
 _have_endowed_the_young_girl_with_a_charac?=
 =?UTF-8?Q?ter_of_social_sacredness._She_has_been_the_sub?=
 =?UTF-8?Q?ject_of_a_far-going_ide?=
 =?UTF-8?Q?alization._=E9=88=A5=E6=B7=B0irginity=E9=88=A5=3F?=
 =?UTF-8?Q?and_=E9=88=A5=E6=B8=9Burity=E9=88=A5=3Fhave_almos?=
 =?UTF-8?Q?t_a_magical_value._This?= =?UTF-8?Q?_attitude_has_a_useful_side,
 _though_it_has_bee?=
 =?UTF-8?Q?n_overdone._The_girl_as_child_does_not_know_sh?=
 =?UTF-8?Q?e_has_any_particular_value_until_she_learns_it?=
 =?UTF-8?Q?_from_others, _but_if_she_is_regarded_with_ador?=
 =?UTF-8?Q?ation_she_correspondingly_respects_herself_and?=
 =?UTF-8?Q?_tends_to_become_what_is_expected_of_her._And_?=
 =?UTF-8?Q?so_she_has_in_f act_a_greater_value._She_makes_?=
 =?UTF-8?Q?a_better_marriage_and_reflects_recognition_on?=
 =?UTF-8?Q?_her_family.But_we_must_understand_that_this_s?=
 =?UTF-8?Q?ublimation_of_life_is_an_investment._It_requir?=
 =?UTF-8?Q?es_that_incessant_attention_and_effort_illustr?=
 =?UTF-8?Q?ated_in_document_No._36_(p._62)_and_goes_on_be?=
 =?UTF-8?Q?st_when_life_is_economically_secure._And_there?=
 =?UTF-8?Q?_are_families_and_whole_strata_of_society_wher?=
 =?UTF-8?Q?e_life_affords_no_investments._There_is_little?=
 =?UTF-8?Q?_to_gain_and_little_to_lose._Social_workers_re?=
 =?UTF-8?Q?port_that_sometimes_overburdened_mothers_with_?=
 =?UTF-8?Q?large_families_complain_that_they_have_no_=E9=88=A5=E6=B8=88ra?=
 =?UTF-8?Q?veyard_luck=E9=88=A5=E6=BF=83=E2=82=AC=E6=94=81ll_the_c?=
 =?UTF-8?Q?hildren_live._In_cases_?=
 =?UTF-8?Q?of_great_neglect_the_girl_cannot_be_said_to_fa?= =?UTF-8?Q?ll,
 _because_she_has_never_risen._She_is_not_im?= =?UTF-8?Q?moral,
 _because_this_implies_the_loss_of_morali?= =?UTF-8?Q?ty, _but_
 a-moral=E9=88=A5=E6=94=8Fever_having_had_a_moral_code.?=" <xflyh1230@sohu.com>
To: "przemyslaw.hawrylewicz.czarnowski"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>, 
 "pawel.rapkiewicz" <pawel.rapkiewicz@intel.com>
Message-ID: <1598239378.79ddbfff6d384d1fbf6f986696eae016.xflyh1230@sohu.com>
Subject: =?UTF-8?B?SG93IHRvIHVzZSBWaXJ0dWFsIE1lZGlhIA==?=
 =?UTF-8?B?dG8gbW91bnQgZm9sZGVycyB0byBob3N077yf?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_28_1354988683.1598239378207"
X-Sohu-DeliverStatus: <1598239378.79ddbfff6d384d1fbf6f986696eae016.xflyh1230@sohu.com>
X-SHIP: 36.45.46.117
X-Sohu-Gateway: 1
X-Sohu-Antispam-Language: 0
X-Sohu-Antispam-Score: 0.167826225515
X-Mailman-Approved-At: Tue, 25 Aug 2020 12:34:56 +1000
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
Reply-To: xflyh1230 <xflyh1230@sohu.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_28_1354988683.1598239378207
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PHA+SGkgUHJ6ZW15c2xhdyw8YnIvPjwvcD48cD5IaQpQYXdlbCw8L3A+PHA+PGJyLz48L3A+PHA+
QWJvdXQgdGhlIFZpcnR1YWwgTWVkaWEgZmVhdHVyZSwgSSB3YW50IHRvIHVzZSB0aGUgVmlydHVh
bE1lZGlhIGZlYXR1cmUgdG8gbW91bnQgYSBmb2xkZXIgb3IgZmlsZS4mbmJzcDs8L3A+PHA+QWx0
aG91Z2ggSVNPIGZpbGVzIGFuZCBDRFJPTSBkZXZpY2VzIGNhbiBiZSBtb3VudGVkIHRvIHRoZSBo
b3N0IHRocm91Z2ggTkJELCZuYnNwOzwvcD48cD5mb2xkZXJzIGFuZCBmaWxlcyBvdGhlciB0aGFu
IElTTyBjYW5ub3QgYmUgbW91bnRlZCBvbiB0aGUgaG9zdC48L3A+PHA+PGJyLz48L3A+PHA+SG93
IHRvIG1vdW50IGEgZmlsZSBvciBmb2xkZXIgdG8gYSBob3N0IHVzaW5nIHRoZSB2aXJ0dWFsIG1l
ZGlhIGZlYXR1cmU/PC9wPjxwPkNhbiB5b3UgZ2l2ZSBtZSBhIGNvbmZpZ3VyYXRpb24gbWV0aG9k
IHRvIGRlYWwgd2l0aCB0aGlzIHByb2JsZW0/PC9wPjxwPjxici8+PC9wPjxwPjxici8+PC9wPjxw
PkkmIzM5O20gcmVhZGluZyBWaXJ0dWFsTWVkaWEubWQgRG9jdW1lbnQsIGFzayBmb3IgaGVscCBm
b3Igc2V2ZXJhbCBxdWVzdGlvbnM6PC9wPjxwPjxici8+PC9wPjxwPjEuIEhhcyB0aGUgY29tbXVu
aXR5IHVwZGF0ZWQgYW5kIHN1cHBvcnRlZCB2aXJ0dWFsIG1lZGlhIG1vdW50aW5nIG9mIGZvbGRl
cnMgYW5kIGZpbGVzPzwvcD48cD4mbmJzcDtJZiBzbywgd2hhdCBkbyBJIG5lZWQgdG8gZG8/IEhv
dyB0byB1cGRhdGUgd2hpY2ggbW9kdWxlcyB0byBzdXBwb3J0PzwvcD48cD48YnIvPjwvcD48cD4y
LiBJZiBJIHdhbnQgdG8gbW91bnQgZm9sZGVycyBhbmQgZmlsZXMsIGRvIEkgbmVlZCB0byB1c2Ug
Q0lGUyAvIE5GUz8gSG93IHRvIGRvIHRoaXM8L3A+PHA+PGJyLz48L3A+PHA+My4gSW4gdGhlIGRv
Y3VtZW50LCBJIHNlZSB0aGUgZm9sbG93aW5nIERCVVMgaW50ZXJmYWNlcywgYnV0IG15IGVudmly
b25tZW50IGRvZXMgbm90IHN1cHBvcnQgdGhlc2UgaW50ZXJmYWNlcy4mbmJzcDs8L3A+PHA+QXJl
IHRoZXkgbmVjZXNzYXJ5IGZvciBmb2xkZXIgbW91bnRpbmc/IFdoaWNoIG1vZHVsZSBuZWVkcyB0
byBiZSB1cGRhdGVkIHRvIGdldCB0aGVzZSBEQlVTIGludGVyZmFjZXM/PC9wPjxwPiZuYnNwO0F0
IHRoZSBzYW1lIHRpbWUsIHdoYXQgc2VydmljZXMgYXJlIG5lZWRlZCB0byBzdXBwb3J0IGl0Pzwv
cD48cD4veHl6L29wZW5ibWNfIHByb2plY3QvVmlydHVhbE1lZGlhL1Byb3h5L0lTTzA8L3A+PHA+
L3h5ei9vcGVuYm1jXyBwcm9qZWN0L1ZpcnR1YWxNZWRpYS9Qcm94eS8xPC9wPjxwPi94eXovb3Bl
bmJtY18gcHJvamVjdC9WaXJ0dWFsTWVkaWEvTGVnYWN5LzA8L3A+PHA+L3h5ei9vcGVuYm1jXyBw
cm9qZWN0L1ZpcnR1YWxNZWRpYS9MZWdhY3kvMTwvcD48cD48YnIvPjwvcD48cD48YnIvPjwvcD48
cD5NeSBjdXJyZW50IGFkYXB0YXRpb24gc2l0dWF0aW9uIGlzIGFzIGZvbGxvd3M6PC9wPjxwPjxi
ci8+PC9wPjxwPjEuIFRoZSBJU08gb3IgZGV2aWNlIGNhbiBiZSBtb3VudGVkIHRvIHRoZSBob3N0
IHRocm91Z2ggTkJELDwvcD48cD5UaGF0IGlzOiBuYmQtc2VydmVyIGlzIG9uIHRoZSBzZXJ2ZXIg
c2lkZSwgQk1DIGV4ZWN1dGVzIG5iZC1jbGllbnQgdGhyb3VnaCBEQlVTIGludGVyZmFjZSB0byBs
b2FkIGludG8gLyBkZXYgLyBuYmR4LDwvcD48cD4mbmJzcDthbmQgdGhlIHZpcnR1YWwgZGV2aWNl
IGNhbiBiZSBzZWVuIG9uIHRoZSBob3N0IHNpZGUuPC9wPjxwPjxici8+PC9wPjxwPjIuIEhvd2V2
ZXIsIGZvbGRlcnMgYW5kIGZpbGVzIG90aGVyIHRoYW4gSVNPIGFuZCBpbWFnZSBjYW5ub3QgYmUg
bW91bnRlZCB0byB0aGUgaG9zdCBjb21wdXRlci48L3A+PHA+SSB0cmllZCBORlMgYW5kIENJRlMu
IE5vdyBJIGp1c3QgZXhlY3V0ZSBjbGllbnQgb24gQk1DIHNpZGUgdG8gc2VlIHRoZSBmb2xkZXIg
YW5kIGZpbGUuJm5ic3A7PC9wPjxwPkJ1dCBob3cgdG8gbWFrZSB0aGUgZm9sZGVyIHZpc2libGUg
b24gdGhlIGhvc3Qgc2lkZSBpcyBtYWtpbmcgbWUgc2NyYXRjaCBteSBoZWFkIDotKDwvcD48cD7v
vIhIb3cgZG8gZmlsZXMgYW5kIGZvbGRlcnMgbW91bnQgbGlrZSBOQkQgZGV2aWNlcz/vvIk8L3A+
PHA+PGJyLz48L3A+PHA+TG9vayBmb3J3b3JkIHRvIHlvdXIgcmVwbHkuPC9wPjxwPjxici8+PC9w
PjxwPkJlc3QgcmVnYXJkcyw8L3A+PHA+WGlhb2hvbmcgWmhhbmc8L3A+PGJyLz48YnIvPjxici8+
PGJyLz48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vYS5hcHAucXEuY29tL28vc2ltcGxlLmpzcD9wa2du
YW1lPWNvbS5zb2h1Lm1haWwuY2xpZW50LmNvcmRvdmEiPjxpbWcgIGJvcmRlcj0iMCIgc3JjPSIv
L2FkLm1haWwuc29odS5jb20vbWFpbC9pbWFnZXMvc2NvcmVfYWRfZm9vdDFfNzUweDc5LnBuZyIv
PiA8L2E+PC9kaXY+Cjxici8+PGJyLz48YnIvPgo=
------=_Part_28_1354988683.1598239378207--
